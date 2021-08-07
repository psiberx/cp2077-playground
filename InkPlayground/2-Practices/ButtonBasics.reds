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
		rows.SetAnchor(inkEAnchor.BottomCenter);
		rows.SetAnchorPoint(new Vector2(0.5, 1.0));
		rows.SetMargin(new inkMargin(0.0, 0.0, 0.0, 50.0));
		rows.SetChildMargin(new inkMargin(0.0, 15.0, 0.0, 15.0));
		rows.Reparent(root);

		let top: ref<inkHorizontalPanel> = new inkHorizontalPanel();
		top.SetFitToContent(true);
		top.SetHAlign(inkEHorizontalAlign.Center);
		top.SetChildMargin(new inkMargin(10.0, 0.0, 10.0, 0.0));
		top.Reparent(rows);

		let bottom: ref<inkHorizontalPanel> = new inkHorizontalPanel();
		bottom.SetFitToContent(true);
		bottom.SetHAlign(inkEHorizontalAlign.Center);
		bottom.SetChildMargin(new inkMargin(10.0, 0.0, 10.0, 0.0));
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
		buttonLeft.SetName(n"Left Button");
		buttonLeft.SetText("Button L");
		buttonLeft.SetFlipped(true);
		buttonLeft.ToggleAnimations(true);
		buttonLeft.ToggleSounds(true);
		buttonLeft.Mount(this.m_bottom, this);

		let buttonRight: ref<GenericButton> = GenericButton.Create();
		buttonRight.SetName(n"Right Button");
		buttonRight.SetText("Button R");
		buttonRight.ToggleAnimations(true);
		buttonRight.ToggleSounds(true);
		buttonRight.Mount(this.m_bottom, this);

		let buttonHub: ref<HubButton> = HubButton.Create();
		buttonHub.SetName(n"Hub Button");
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
			button.RegisterToCallback(n"OnClick", this, n"OnButtonClick");
			button.RegisterToCallback(n"OnRelease", this, n"OnButtonInput");
		};
	}

	protected cb func OnButtonClick(widget: wref<inkWidget>) -> Bool {
		let button: ref<inkCustomButtonController> = widget.GetController() as inkCustomButtonController;

		this.Log("[" + NameToString(button.GetName()) + "] Event: OnClick");
	}

	protected cb func OnButtonInput(evt: ref<inkPointerEvent>) -> Bool {
		let button: ref<inkCustomButtonController> = evt.GetTarget().GetController() as inkCustomButtonController;

		if evt.IsAction(n"popup_moveUp") {
			button.SetDisabled(!button.IsDisabled());

			this.PlaySound(n"MapPin", n"OnCreate");
			this.Log("[" + NameToString(button.GetName()) + "] State: " + (button.IsDisabled() ? "Disabled" : "Enabled"));
		};
	}
}
