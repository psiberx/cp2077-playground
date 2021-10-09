// -----------------------------------------------------------------------------
// TryAttachCustomPopupEvent
// -----------------------------------------------------------------------------

module BaseLib

public class TryAttachCustomPopupEvent extends CustomPopupEvent {
	protected let notificationData: ref<inkGameNotificationData>;

	protected let notificationToken: ref<inkGameNotificationToken>;

	protected let initialCount: Int32;

	public func GetNotificationData() -> ref<inkGameNotificationData> {
		return this.notificationData;
	}

	public func GetNotificationToken() -> ref<inkGameNotificationToken> {
		return this.notificationToken;
	}

	public func GetInitialCount() -> Int32 {
		return this.initialCount;
	}

	public static func Create(controller: ref<CustomPopupController>, data: ref<inkGameNotificationData>, token: ref<inkGameNotificationToken>, initialCount: Int32) -> ref<TryAttachCustomPopupEvent> {
		let event: ref<TryAttachCustomPopupEvent> = new TryAttachCustomPopupEvent();
		event.controller = controller;
		event.notificationData = data;
		event.notificationToken = token;
		event.initialCount = initialCount;

		return event;
	}
}
