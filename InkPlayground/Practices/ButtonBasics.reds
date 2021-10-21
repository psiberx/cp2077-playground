module InkPlayground.Practices
import InkPlayground.Workbench.Practice
import BaseLib.UI.*

public class ButtonBasics extends Practice {
	protected let m_top: ref<inkCompoundWidget>;

	protected let m_bottom: ref<inkCompoundWidget>;

	protected let m_buttons: array<ref<CustomButton>>;

	protected cb func OnCreate() -> Void {
		let root: ref<inkCanvas> = new inkCanvas();
		root.SetName(this.GetClassName());
		root.SetAnchor(inkEAnchor.Fill);
		
		let rows: ref<inkVerticalPanel> = new inkVerticalPanel();
		rows.SetName(n"rows");
		rows.SetFitToContent(true);
		rows.SetAnchor(inkEAnchor.Centered);
		rows.SetAnchorPoint(new Vector2(0.5, 0.5));
		rows.SetChildMargin(new inkMargin(0.0, 30.0, 0.0, 30.0));
		rows.Reparent(root);

		let top: ref<inkHorizontalPanel> = new inkHorizontalPanel();
		top.SetFitToContent(true);
		top.SetHAlign(inkEHorizontalAlign.Center);
		top.SetChildMargin(new inkMargin(20.0, 0.0, 20.0, 0.0));
		top.Reparent(rows);

		let bottom: ref<inkHorizontalPanel> = new inkHorizontalPanel();
		bottom.SetFitToContent(true);
		bottom.SetHAlign(inkEHorizontalAlign.Center);
		bottom.SetChildMargin(new inkMargin(20.0, 0.0, 20.0, 0.0));
		bottom.Reparent(rows);

		this.m_top = top;
		this.m_bottom = bottom;

		this.SetRootWidget(root);
	}

	protected cb func OnInitialize() -> Void {
		this.InitializeButtons();
		this.RegisterListeners();

		this.Log(this.GetLocalizedText("InkPlayground-ButtonBasics-Event-Ready"));
	}

	protected func InitializeButtons() -> Void {
		let buttonLeft: ref<BaseButton> = BaseButton.Create();
		buttonLeft.SetName(n"LeftButton");
		buttonLeft.SetText(this.GetLocalizedText("InkPlayground-ButtonBasics-Button-Left"));
		buttonLeft.SetFlipped(true);
		buttonLeft.ToggleAnimations(true);
		buttonLeft.ToggleSounds(true);
		buttonLeft.Mount(this.m_bottom, this);

		let buttonRight: ref<BaseButton> = BaseButton.Create();
		buttonRight.SetName(n"RightButton");
		buttonRight.SetText(this.GetLocalizedText("InkPlayground-ButtonBasics-Button-Right"));
		buttonRight.ToggleAnimations(true);
		buttonRight.ToggleSounds(true);
		buttonRight.Mount(this.m_bottom, this);

		let buttonHub: ref<HubButton> = HubButton.Create();
		buttonHub.SetName(n"HubButton");
		buttonHub.SetText(this.GetLocalizedText("InkPlayground-ButtonBasics-Button-Hub"));
		buttonHub.SetIcon(n"ico_deck_hub");
		buttonHub.ToggleAnimations(true);
		buttonHub.ToggleSounds(true);
		buttonHub.Mount(this.m_top, this);

		ArrayPush(this.m_buttons, buttonLeft);
		ArrayPush(this.m_buttons, buttonRight);
		ArrayPush(this.m_buttons, buttonHub);
	}

	protected func RegisterListeners() -> Void {
		for button in this.m_buttons {
			button.RegisterToCallback(n"OnClick", this, n"OnClick");
			button.RegisterToCallback(n"OnRelease", this, n"OnRelease");
			button.RegisterToCallback(n"OnEnter", this, n"OnEnter");
			button.RegisterToCallback(n"OnLeave", this, n"OnLeave");
		}
	}

	protected cb func OnClick(widget: wref<inkWidget>) -> Bool {
		let button: ref<CustomButton> = widget.GetController() as CustomButton;

		let buttonName: String = button.GetText();
		let buttonEvent: String = this.GetLocalizedText("InkPlayground-ButtonBasics-Event-Click");

		this.Log(buttonName + ": " + buttonEvent);
	}

	protected cb func OnRelease(evt: ref<inkPointerEvent>) -> Bool {
		let button: ref<CustomButton> = evt.GetTarget().GetController() as CustomButton;

		if evt.IsAction(n"popup_moveUp") {
			button.SetDisabled(!button.IsDisabled());

			let buttonName: String = button.GetText();
			let buttonEvent: String = button.IsDisabled()
				? this.GetLocalizedText("InkPlayground-ButtonBasics-Event-Disable")
				: this.GetLocalizedText("InkPlayground-ButtonBasics-Event-Enable");

			this.Log(buttonName + ": " + buttonEvent);
			this.UpdateHints(button);

			this.PlaySound(n"MapPin", n"OnCreate");
		}
	}

	protected cb func OnEnter(evt: ref<inkPointerEvent>) -> Bool {
		let button: ref<CustomButton> = evt.GetTarget().GetController() as CustomButton;

		this.UpdateHints(button);
	}

	protected cb func OnLeave(evt: ref<inkPointerEvent>) -> Bool {
		this.RemoveHints();
	}

	protected func UpdateHints(button: ref<CustomButton>) -> Void {
		this.UpdateHint(
			n"popup_moveUp",
			this.GetLocalizedText(
				button.IsEnabled()
					? "InkPlayground-ButtonBasics-Action-Disable"
					: "InkPlayground-ButtonBasics-Action-Enable"
			)
		);

		this.UpdateHint(
			n"click",
			this.GetLocalizedText("InkPlayground-ButtonBasics-Action-Interact"),
			button.IsEnabled()
		);
	}

	protected func RemoveHints() -> Void {
		this.RemoveHint(n"popup_moveUp");
		this.RemoveHint(n"click");
	}
}
