// -----------------------------------------------------------------------------
// PopupsManager Extensions
// -----------------------------------------------------------------------------
//
// - Handle custom popups
//

public class CustomPopupNotificationData extends inkGameNotificationData {
	public let controller: ref<inkCustomPopupController>;
}

@addField(PopupsManager)
private let m_notificationsContainer: wref<inkCompoundWidget>;

@addMethod(PopupsManager)
protected cb func OnInitialize() -> Bool {
	this.m_notificationsContainer = this.GetRootCompoundWidget().GetWidgetByPathName(n"NotificationsContainer") as inkCompoundWidget;
}

@addMethod(PopupsManager)
protected cb func OnShowPopupEvent(evt: ref<inkShowPopupEvent>) -> Bool {
	let popupController: ref<inkCustomPopupController> = evt.GetPopup();

	if !IsDefined(popupController) {
		return false;
	};

	let notificationData: ref<CustomPopupNotificationData> = new CustomPopupNotificationData();
	notificationData.controller = popupController;
	notificationData.notificationName = popupController.GetName();
	notificationData.queueName = popupController.GetQueueName();
	notificationData.isBlocking = popupController.IsBlocking();
	notificationData.useCursor = popupController.UseCursor();

	let notificationToken: ref<inkGameNotificationToken> = this.ShowGameNotification(notificationData);

	this.QueueNextFrameEvent(
		inkTryAttachPopupEvent.Create(
			popupController,
			notificationData,
			notificationToken,
			this.m_notificationsContainer.GetNumChildren()
		)
	);
}

@addMethod(PopupsManager)
protected func QueueNextFrameEvent(evt: ref<Event>) -> Void {
	let gameInstance: GameInstance = this.GetPlayerControlledObject().GetGame();

	GameInstance.GetDelaySystem(gameInstance).DelayEventNextFrame(this, evt);
}

@addMethod(PopupsManager)
protected cb func OnTryAttachPopupEvent(evt: ref<inkTryAttachPopupEvent>) -> Bool {
	let initialCount: Int32 = evt.GetInitialCount();
	let currentCount: Int32 = this.m_notificationsContainer.GetNumChildren();

	if currentCount == evt.GetInitialCount() {
		this.QueueNextFrameEvent(evt);
		return false;
	};

	let popupController: ref<inkCustomPopupController> = evt.GetPopup();
	let notificationData: ref<inkGameNotificationData> = evt.GetNotificationData();
	let notificationToken: ref<inkGameNotificationToken> = evt.GetNotificationToken();
	let bracketsContainer: wref<inkCompoundWidget> = this.GetRootCompoundWidget().GetWidgetByPathName(n"BracketsContainer") as inkCompoundWidget;

	let containerWidget: ref<inkCanvas> = new inkCanvas();
	containerWidget.SetName(popupController.GetName());
	containerWidget.SetAnchor(inkEAnchor.Fill);
	containerWidget.SetAnchorPoint(new Vector2(0.5, 0.5));
	containerWidget.SetSize(this.m_notificationsContainer.GetSize());
	containerWidget.Reparent(this.m_notificationsContainer, initialCount + 2);

	let rootWidget: ref<inkCanvas> = new inkCanvas();
	rootWidget.SetName(n"Root");
	rootWidget.SetAnchor(bracketsContainer.GetAnchor());
	rootWidget.SetAnchorPoint(bracketsContainer.GetAnchorPoint());
	rootWidget.SetSize(bracketsContainer.GetSize());
	rootWidget.SetScale(bracketsContainer.GetScale());
	rootWidget.Reparent(containerWidget);

	popupController.Attach(rootWidget, this, notificationData);

	notificationToken.RegisterListener(this, n"OnPopupNotificationClosed");
}

@addMethod(PopupsManager)
protected cb func OnPopupNotificationClosed(data: ref<inkGameNotificationData>) -> Bool {
	let notificationData: ref<CustomPopupNotificationData> = data as CustomPopupNotificationData;
	let popupController: ref<inkCustomPopupController> = notificationData.controller;

	if IsDefined(popupController) {
		let containerWidget: ref<inkCanvas> = this.m_notificationsContainer.GetWidgetByPathName(popupController.GetName()) as inkCanvas;

		if IsDefined(containerWidget) {
			this.m_notificationsContainer.RemoveChild(containerWidget);
		};
	};
}

@addMethod(PopupsManager)
protected cb func OnHidePopupEvent(evt: ref<inkHidePopupEvent>) -> Bool {
	let popupController: ref<inkCustomPopupController> = evt.GetPopup();

	if IsDefined(popupController) {
		popupController.Detach();
	};
}
