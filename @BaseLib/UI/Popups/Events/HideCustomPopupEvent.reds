// -----------------------------------------------------------------------------
// HideCustomPopupEvent
// -----------------------------------------------------------------------------

module BaseLib

public class HideCustomPopupEvent extends CustomPopupEvent {
	public static func Create(controller: ref<CustomPopupController>) -> ref<HideCustomPopupEvent> {
		let event: ref<HideCustomPopupEvent> = new HideCustomPopupEvent();
		event.controller = controller;

		return event;
	}
}
