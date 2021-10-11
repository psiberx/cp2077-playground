// -----------------------------------------------------------------------------
// Manual Leaning Mode
// -----------------------------------------------------------------------------
//
// When aiming press the corresponding keys (default `Q` and `E`) to lean.
// Other actions bound to the same keys will be discarded when leaning.
//
// Additional installation steps:
//
// 1) Edit `r6/config/inputContexts.xml` to add new actions to the Exploration context:
//    <context name="Exploration">
//      ...
//      <action name="LeanLeft" map="LeanLeft_Button"/>
//      <action name="LeanRight" map="LeanRight_Button"/>
//    </context>
//
// 2) Optionally edit `r6/config/inputUserMappings.xml` to change the bindings:
//    <mapping name="LeanLeft_Button" type="Button">
//      <button id="IK_Q"/>
//    </mapping>
//    <mapping name="LeanRight_Button" type="Button">
//      <button id="IK_E"/>
//    </mapping>
//

module ManualLeaning

public class LeaningHandler {
	private let m_player: wref<PlayerPuppet>;

	private let m_obstacleSystem: ref<PlayerObstacleSystem>;

	private let m_currentLeaning: coverLeanDirection;

	private let m_lastLeaning: coverLeanDirection;

	private let m_isAiming: Bool;

	private let m_isInCover: Bool;

	private let m_attachedCallback: Uint32;

	private let m_aimingListener: ref<CallbackHandle>;

	private let m_coverListener: ref<CallbackHandle>;

	public func Register(player: wref<PlayerPuppet>) -> Void {
		this.m_player = player;
		this.m_player.RegisterInputListener(this, n"LeanLeft");
		this.m_player.RegisterInputListener(this, n"LeanRight");

		this.m_attachedCallback = GameInstance.GetPlayerSystem(this.m_player.GetGame()).RegisterPlayerPuppetAttachedCallback(this, n"OnPlayerAttached");

		this.ResetState();
	}

	public func Unregister() -> Void {
		GameInstance.GetPlayerSystem(this.m_player.GetGame()).UnregisterPlayerPuppetAttachedCallback(this.m_attachedCallback);

		this.m_player.UnregisterInputListener(this);
		this.m_player = null;

		this.m_aimingListener = null;
		this.m_coverListener = null;
		this.m_obstacleSystem = null;

		this.ResetState();
	}

	public func ResetState() -> Bool {
		this.m_currentLeaning = coverLeanDirection.Top;
		this.m_lastLeaning = coverLeanDirection.Top;
	}

	public func IsLeaning() -> Bool {
		return !Equals(this.m_currentLeaning, coverLeanDirection.Top);
	}

	public func WasLeaning() -> Bool {
		return !Equals(this.m_lastLeaning, coverLeanDirection.Top);
	}

	public func LeanTo(leanDirection: coverLeanDirection) -> Bool {
		if !this.m_isAiming {
			return false;
		}

		if Equals(this.m_currentLeaning, leanDirection) {
			return false;
		}

		if Equals(leanDirection, coverLeanDirection.Left) {
			this.m_obstacleSystem.ManualLeanRight(this.m_player);

			if this.m_isInCover {
				this.m_obstacleSystem.ManualLeanRight(this.m_player);
			}
		} else {
			this.m_obstacleSystem.ManualLeanLeft(this.m_player);

			if this.m_isInCover {
				this.m_obstacleSystem.ManualLeanLeft(this.m_player);
			}
		}

		this.m_currentLeaning = this.IsLeaning() ? coverLeanDirection.Top : leanDirection;
		this.m_lastLeaning = coverLeanDirection.Top;

		return true;
	}

	public func LeanLeft() -> Bool {
		return this.LeanTo(coverLeanDirection.Left);
	}

	public func LeanRight() -> Bool {
		return this.LeanTo(coverLeanDirection.Right);
	}

	protected cb func OnPlayerAttached(playerPuppet: ref<GameObject>) -> Void {
		let pmsBlackboard: ref<IBlackboard> = this.m_player.GetPlayerStateMachineBlackboard();
		this.m_aimingListener = pmsBlackboard.RegisterListenerInt(GetAllBlackboardDefs().PlayerStateMachine.UpperBody, this, n"OnUpperBodyStateChanged");
		this.m_coverListener = pmsBlackboard.RegisterListenerBool(GetAllBlackboardDefs().PlayerStateMachine.UsingCover, this, n"OnUsingCoverStateChanged");

		this.m_obstacleSystem = GameInstance.GetSpatialQueriesSystem(this.m_player.GetGame()).GetPlayerObstacleSystem();
	}

	protected cb func OnUpperBodyStateChanged(state: Int32) -> Bool {
		let isAiming: Bool = (state == EnumInt(gamePSMUpperBodyStates.Aim));

		if !Equals(isAiming, this.m_isAiming) {
			if isAiming {
				if this.WasLeaning() {
					let leanCallback: ref<DelayedLeanToCallback> = new DelayedLeanToCallback();
					leanCallback.direction = this.m_lastLeaning;
					leanCallback.handler = this;

					GameInstance.GetDelaySystem(this.m_player.GetGame()).DelayCallback(leanCallback, 0);
				}
			} else {
				if this.IsLeaning() {
					this.m_lastLeaning = this.m_currentLeaning;
					this.m_currentLeaning = coverLeanDirection.Top;
				}
			}
		}

		this.m_isAiming = isAiming;
	}

	protected cb func OnUsingCoverStateChanged(state: Bool) -> Bool {
		this.m_isInCover = state;
	}

	protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Void {
		if ListenerAction.IsButtonJustPressed(action) {
			let leanDirection = ListenerAction.IsAction(action, n"LeanLeft")
				? coverLeanDirection.Left
				: coverLeanDirection.Right;

			if this.LeanTo(leanDirection) {
				ListenerActionConsumer.Consume(consumer);
			}

			return;
		}

		if ListenerAction.IsButtonJustReleased(action) {
			if this.WasLeaning() {
				ListenerActionConsumer.Consume(consumer);
				this.ResetState();
			} else {
				let leanDirection = ListenerAction.IsAction(action, n"LeanLeft")
					? coverLeanDirection.Right
					: coverLeanDirection.Left;

				if this.LeanTo(leanDirection) {
					ListenerActionConsumer.Consume(consumer);
				}
			}
		}
	}
}

public class DelayedLeanToCallback extends DelayCallback {
	public let handler: ref<LeaningHandler>;

	public let direction: coverLeanDirection;

	public func Call() -> Void {
		this.handler.LeanTo(this.direction);
	}
}

@addField(PlayerPuppet)
private let m_leaningHandler: ref<LeaningHandler>;

@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
	if this.IsControlledByLocalPeer() || IsHost() {
		this.m_leaningHandler = new LeaningHandler();
		this.m_leaningHandler.Register(this);
	}

	wrappedMethod();
}

@wrapMethod(PlayerPuppet)
protected cb func OnDetach() -> Bool {
	wrappedMethod();

	if this.IsControlledByLocalPeer() || IsHost() {
		this.m_leaningHandler.Unregister();
		this.m_leaningHandler = null;
	}
}
