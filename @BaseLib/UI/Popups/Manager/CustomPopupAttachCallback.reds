// -----------------------------------------------------------------------------
// CustomPopupAttachCallback
// -----------------------------------------------------------------------------

module BaseLib

public class CustomPopupAttachCallback extends DelayCallback {
	protected let request: ref<CustomPopupAttachRequest>;

	public func Call() -> Void {
		CustomPopupManager.GetInstance().AttachPopup(this.request);
	}

	public static func Create(request: ref<CustomPopupAttachRequest>) -> ref<CustomPopupAttachCallback> {
		let callback: ref<CustomPopupAttachCallback> = new CustomPopupAttachCallback();
		callback.request = request;

		return callback;
	}
}
