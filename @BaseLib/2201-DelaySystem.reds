// -----------------------------------------------------------------------------
// DelaySystem Extensions
// -----------------------------------------------------------------------------
//
// - Delayed events for UI controllers
//
// -----------------------------------------------------------------------------
//
// class DelaySystem extends IDelaySystem {
//   public func DelayEvent(controller: wref<inkGameController>, eventToDelay: ref<Event>, timeToDelay: Float, opt isAffectedByTimeDilation: Bool) -> DelayID
//   public func DelayEventNextFrame(controller: wref<inkGameController>, eventToDelay: ref<Event>) -> Void
// }
//

public class ControllerEventDelayCallback extends DelayCallback {
	public let controller: wref<inkGameController>;

	public let event: ref<Event>;

	public func Call() -> Void {
		if IsDefined(this.controller) {
			this.controller.QueueEvent(this.event);
		};
	}
}

@addMethod(DelaySystem)
public func DelayEvent(controller: wref<inkGameController>, eventToDelay: ref<Event>, timeToDelay: Float, opt isAffectedByTimeDilation: Bool) -> DelayID {
	let callback: ref<ControllerEventDelayCallback> = new ControllerEventDelayCallback();
	callback.controller = controller;
	callback.event = eventToDelay;

	return this.DelayCallback(callback, timeToDelay, isAffectedByTimeDilation);
}

@addMethod(DelaySystem)
public func DelayEventNextFrame(controller: wref<inkGameController>, eventToDelay: ref<Event>) -> Void {
	let callback: ref<ControllerEventDelayCallback> = new ControllerEventDelayCallback();
	callback.controller = controller;
	callback.event = eventToDelay;

	this.DelayCallbackNextFrame(callback);
}
