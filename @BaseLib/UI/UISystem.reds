// -----------------------------------------------------------------------------
// UISystem Extensions
// -----------------------------------------------------------------------------
//
// - Request show / hide custom popups
// - Spawn input hints from anywhere
// - [TODO] Detect current theme colors aka ThemePicker
//   (to make widgets compatible with UI tweaking mods)
//
// -----------------------------------------------------------------------------
//
// class UISystem extends IUISystem {
//   public func ShowCustomPopup(controller: ref<CustomPopupController>) -> Void
//   public func HideCustomPopup(controller: ref<CustomPopupController>) -> Void
//   public func SpawnButtonHints(parentWidget: wref<inkWidget>) -> ref<ButtonHints>
// }
//

module BaseLib

@addMethod(UISystem)
public func ShowCustomPopup(controller: ref<CustomPopupController>) -> Void {
	this.QueueEvent(ShowCustomPopupEvent.Create(controller));
}

@addMethod(UISystem)
public func HideCustomPopup(controller: ref<CustomPopupController>) -> Void {
	this.QueueEvent(HideCustomPopupEvent.Create(controller));
}

@addField(UISystem)
let buttonHints: ref<inkWidget>;

@addMethod(UISystem)
public func SpawnButtonHints(parentWidget: wref<inkWidget>) -> ref<ButtonHints> {
	return this.buttonHints.GetController().SpawnFromLocal(parentWidget, n"Root").GetController() as ButtonHints;
}

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnInitialize() -> Bool {
	wrappedMethod();

	let uiSystem: ref<UISystem> = GameInstance.GetUISystem(this.GetPlayerControlledObject().GetGame());
	uiSystem.buttonHints = this.SpawnFromExternal(this.GetRootWidget(), r"base\\gameplay\\gui\\common\\buttonhints.inkwidget", n"Root");
}