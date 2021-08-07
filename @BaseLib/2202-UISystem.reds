// -----------------------------------------------------------------------------
// UISystem Extensions
// -----------------------------------------------------------------------------
//
// - Request show / hide custom popups
// - Spawn input hints from anywhere
// - [TODO] Detect current theme colors aka ThemePicker
//   (to make widgets that are compatible with UI tweaking mods)
//
// -----------------------------------------------------------------------------
//
// class UISystem extends IUISystem {
//   public func ShowCustomPopup(controller: ref<inkCustomPopupController>) -> Void
//   public func HideCustomPopup(controller: ref<inkCustomPopupController>) -> Void
// }
//

@addMethod(UISystem)
public func ShowCustomPopup(controller: ref<inkCustomPopupController>) -> Void {
	this.QueueEvent(inkShowPopupEvent.Create(controller));
}

@addMethod(UISystem)
public func HideCustomPopup(controller: ref<inkCustomPopupController>) -> Void {
	this.QueueEvent(inkHidePopupEvent.Create(controller));
}

@addField(UISystem)
let buttonHints: ref<inkWidget>;

@addMethod(UISystem)
public func SpawnButtonHints(parentWidget: wref<inkWidget>) -> ButtonHints {
	return this.buttonHints.GetController().SpawnFromLocal(parentWidget, n"Root").GetController() as ButtonHints;
}

@addMethod(MainMenuGameController)
protected cb func OnPlayerAttach(playerPuppet: ref<GameObject>) -> Bool {
	let uiSystem: ref<UISystem> = GameInstance.GetUISystem(playerPuppet.GetGame());
	uiSystem.buttonHints = this.SpawnFromExternal(this.GetRootWidget(), r"base\\gameplay\\gui\\common\\buttonhints.inkwidget", n"Root");
}
