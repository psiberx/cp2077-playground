module InkPlayground.Practices
import InkPlayground.Workbench.Practice

public class ButtonBasics extends Practice {
	protected let m_top: ref<inkCompoundWidget>;

	protected let m_bottom: ref<inkCompoundWidget>;

	protected let m_buttons: array<ref<inkCustomButtonController>>;

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

		this.Log("[Button Basics] Buttons are ready");
	}

	protected func InitializeButtons() -> Void {
		let buttonLeft: ref<GenericButton> = GenericButton.Create();
		buttonLeft.SetName(n"LeftButton");
		buttonLeft.SetText("Button L");
		buttonLeft.SetFlipped(true);
		buttonLeft.ToggleAnimations(true);
		buttonLeft.ToggleSounds(true);
		buttonLeft.Mount(this.m_bottom, this);

		let buttonRight: ref<GenericButton> = GenericButton.Create();
		buttonRight.SetName(n"RightButton");
		buttonRight.SetText("Button R");
		buttonRight.ToggleAnimations(true);
		buttonRight.ToggleSounds(true);
		buttonRight.Mount(this.m_bottom, this);

		let buttonHub: ref<HubButton> = HubButton.Create();
		buttonHub.SetName(n"HubButton");
		buttonHub.SetText("Hub Button");
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
		};
	}

	protected cb func OnClick(widget: wref<inkWidget>) -> Bool {
		let button: ref<inkCustomButtonController> = widget.GetController() as inkCustomButtonController;

		this.Log("[" + NameToString(button.GetName()) + "] Event: OnClick");
	}

	protected cb func OnRelease(evt: ref<inkPointerEvent>) -> Bool {
		let button: ref<inkCustomButtonController> = evt.GetTarget().GetController() as inkCustomButtonController;

		if evt.IsAction(n"popup_moveUp") {
			button.SetDisabled(!button.IsDisabled());

			this.PlaySound(n"MapPin", n"OnCreate");
			this.Log("[" + NameToString(button.GetName()) + "] State: " + (button.IsDisabled() ? "Disabled" : "Enabled"));

			this.UpdateHints(button);
		};
	}

	protected cb func OnEnter(evt: ref<inkPointerEvent>) -> Bool {
		let button: ref<inkCustomButtonController> = evt.GetTarget().GetController() as inkCustomButtonController;

		this.UpdateHints(button);
	}

	protected cb func OnLeave(evt: ref<inkPointerEvent>) -> Bool {
		this.RemoveHints();
	}

	protected func UpdateHints(button: ref<inkCustomButtonController>) -> Void {
		this.UpdateHint(n"popup_moveUp", button.IsEnabled() ? "Disable" : "Enable");
		this.UpdateHint(n"click", "Interact", button.IsEnabled());
	}

	protected func RemoveHints() -> Void {
		this.RemoveHint(n"popup_moveUp");
		this.RemoveHint(n"click");
	}
}
