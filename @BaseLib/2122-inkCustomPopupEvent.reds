// -----------------------------------------------------------------------------
// inkCustomPopupEvent
// -----------------------------------------------------------------------------

public abstract class inkCustomPopupEvent extends inkCustomEvent {
	public func GetPopup() -> ref<inkCustomPopupController> {
		return this.controller as inkCustomPopupController;
	}
}

public class inkShowPopupEvent extends inkCustomPopupEvent {
	public static func Create(controller: ref<inkCustomPopupController>) -> ref<inkShowPopupEvent> {
		let event: ref<inkShowPopupEvent> = new inkShowPopupEvent();
		event.controller = controller;

		return event;
	}
}

public class inkHidePopupEvent extends inkCustomPopupEvent {
	public static func Create(controller: ref<inkCustomPopupController>) -> ref<inkHidePopupEvent> {
		let event: ref<inkHidePopupEvent> = new inkHidePopupEvent();
		event.controller = controller;

		return event;
	}
}

public class inkTryAttachPopupEvent extends inkCustomPopupEvent {
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

	public static func Create(controller: ref<inkCustomPopupController>, data: ref<inkGameNotificationData>, token: ref<inkGameNotificationToken>, initialCount: Int32) -> ref<inkTryAttachPopupEvent> {
		let event: ref<inkTryAttachPopupEvent> = new inkTryAttachPopupEvent();
		event.controller = controller;
		event.notificationData = data;
		event.notificationToken = token;
		event.initialCount = initialCount;

		return event;
	}
}
