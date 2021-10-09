// -----------------------------------------------------------------------------
// CustomPopupEvent
// -----------------------------------------------------------------------------

module BaseLib

public abstract class CustomPopupEvent extends inkCustomEvent {
	public func GetPopup() -> ref<CustomPopupController> {
		return this.controller as CustomPopupController;
	}
}
