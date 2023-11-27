module InkPlayground.Practices
import InkPlayground.Workbench.Practice
import Codeware.UI.*

public class ButtonBasics extends Practice {
	protected let m_top: wref<inkCompoundWidget>;
	protected let m_bottom: wref<inkCompoundWidget>;

	protected cb func OnCreate() {
		let root = new inkCanvas();
		root.SetName(this.GetClassName());
		root.SetAnchor(inkEAnchor.Fill);
		
		let rows = new inkVerticalPanel();
		rows.SetName(n"rows");
		rows.SetFitToContent(true);
		rows.SetAnchor(inkEAnchor.Centered);
		rows.SetAnchorPoint(new Vector2(0.5, 0.75));
		rows.SetChildMargin(new inkMargin(0.0, 30.0, 0.0, 30.0));
		rows.Reparent(root);

		let top = new inkHorizontalPanel();
		top.SetFitToContent(true);
		top.SetHAlign(inkEHorizontalAlign.Center);
		top.SetChildMargin(new inkMargin(20.0, 0.0, 20.0, 0.0));
		top.Reparent(rows);

		let bottom = new inkHorizontalPanel();
		bottom.SetFitToContent(true);
		bottom.SetHAlign(inkEHorizontalAlign.Center);
		bottom.SetChildMargin(new inkMargin(20.0, 0.0, 20.0, 0.0));
		bottom.Reparent(rows);

		let buttonLeft = SimpleButton.Create();
		buttonLeft.SetName(n"LeftButton");
		buttonLeft.SetText(this.GetLocalizedText("InkPlayground-ButtonBasics-Button-Left"));
		buttonLeft.SetFlipped(true);
		buttonLeft.ToggleAnimations(true);
		buttonLeft.ToggleSounds(true);
		buttonLeft.Reparent(bottom);

		let buttonRight = SimpleButton.Create();
		buttonRight.SetName(n"RightButton");
		buttonRight.SetText(this.GetLocalizedText("InkPlayground-ButtonBasics-Button-Right"));
		buttonRight.ToggleAnimations(true);
		buttonRight.ToggleSounds(true);
		buttonRight.Reparent(bottom);

		let buttonHub = HubLinkButton.Create();
		buttonHub.SetName(n"HubButton");
		buttonHub.SetText(this.GetLocalizedText("InkPlayground-ButtonBasics-Button-Hub"));
		buttonHub.SetIcon(n"ico_deck_hub");
		buttonHub.ToggleAnimations(true);
		buttonHub.ToggleSounds(true);
		buttonHub.Reparent(top);

		this.m_top = top;
		this.m_bottom = bottom;

		this.SetRootWidget(root);
	}

	protected cb func OnInitialize() {
		this.RegisterListeners(this.m_top);
		this.RegisterListeners(this.m_bottom);

		this.Log(this.GetLocalizedText("InkPlayground-ButtonBasics-Event-Ready"));
	}

	protected func RegisterListeners(container: wref<inkCompoundWidget>) {
		let childIndex = 0;
		let numChildren = container.GetNumChildren();

		while childIndex < numChildren {
			let widget = container.GetWidgetByIndex(childIndex);
			let button = widget.GetController() as CustomButton;

			if IsDefined(button) {
				button.RegisterToCallback(n"OnBtnClick", this, n"OnClick");
				button.RegisterToCallback(n"OnRelease", this, n"OnRelease");
				button.RegisterToCallback(n"OnEnter", this, n"OnEnter");
				button.RegisterToCallback(n"OnLeave", this, n"OnLeave");
			}

			childIndex += 1;
		}
	}

	protected cb func OnClick(widget: wref<inkWidget>) -> Bool {
		let button = widget.GetController() as CustomButton;

		let buttonName = button.GetText();
		let buttonEvent = this.GetLocalizedText("InkPlayground-ButtonBasics-Event-Click");

		this.Log(buttonName + ": " + buttonEvent);
	}

	protected cb func OnRelease(evt: ref<inkPointerEvent>) -> Bool {
		let button = evt.GetTarget().GetController() as CustomButton;

		if evt.IsAction(n"popup_moveUp") {
			button.SetDisabled(!button.IsDisabled());

			let buttonName = button.GetText();
			let buttonEvent = button.IsDisabled()
				? this.GetLocalizedText("InkPlayground-ButtonBasics-Event-Disable")
				: this.GetLocalizedText("InkPlayground-ButtonBasics-Event-Enable");

			this.Log(buttonName + ": " + buttonEvent);
			this.UpdateHints(button);

			this.PlaySound(n"MapPin", n"OnCreate");
		}
	}

	protected cb func OnEnter(evt: ref<inkPointerEvent>) -> Bool {
		let button = evt.GetTarget().GetController() as CustomButton;

		this.UpdateHints(button);
	}

	protected cb func OnLeave(evt: ref<inkPointerEvent>) -> Bool {
		this.RemoveHints();
	}

	protected func UpdateHints(button: ref<CustomButton>) {
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

	protected func RemoveHints() {
		this.RemoveHint(n"popup_moveUp");
		this.RemoveHint(n"click");
	}
}
