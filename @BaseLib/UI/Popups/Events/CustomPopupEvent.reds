// -----------------------------------------------------------------------------
// CustomPopupEvent
// -----------------------------------------------------------------------------

module BaseLib

public abstract class CustomPopupEvent extends inkCustomEvent {
	public func GetPopupController() -> ref<CustomPopup> {
		return this.controller as CustomPopup;
	}
}
