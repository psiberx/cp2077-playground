// -----------------------------------------------------------------------------
// UISystem Extensions
// -----------------------------------------------------------------------------
//
// - Request show / hide custom popups
// - [TODO] Spawn input hints widget
// - [TODO] Detect current theme colors aka ThemePicket
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
