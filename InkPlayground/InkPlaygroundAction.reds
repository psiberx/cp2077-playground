import InkPlayground.InkPlaygroundPopup
import Codeware.Localization.LocalizationSystem

@replaceMethod(BaseContextEvents)
private final func UpdateHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
    let context: ActiveBaseContext;
    let contextTemp: ActiveBaseContext;

    if (this.ShouldForceRefreshInputHints(stateContext)) {
		this.RemoveInkPlaygroundPopupInputHints(stateContext, scriptInterface);
		this.RemoveGenericExplorationInputHints(stateContext, scriptInterface);
		this.RemoveLadderInputHints(stateContext, scriptInterface);
		this.RemoveSwimmingInputHints(stateContext, scriptInterface);
		this.RemoveBodyCarryInputHints(stateContext, scriptInterface);
		this.RemoveMeleeInputHints(stateContext, scriptInterface);
		this.RemoveRangedInputHints(stateContext, scriptInterface);
		this.m_isGameplayInputHintRefreshRequired = false;
    };

	let isValidState = this.IsStateValidForExploration(stateContext, scriptInterface);

	if isValidState || (this.IsInHighLevelState(stateContext, n"exploration") && DefaultTransition.HasRightWeaponEquipped(scriptInterface)) {
		if !stateContext.GetBoolParameter(n"isInkPlaygroundPopupInputHintDisplayed", true) {
			this.ShowInkPlaygroundPopupInputHints(stateContext, scriptInterface);
		}
	} else {
		if stateContext.GetBoolParameter(n"isInkPlaygroundPopupInputHintDisplayed", true) {
			this.RemoveInkPlaygroundPopupInputHints(stateContext, scriptInterface);
		}
	}

	if isValidState {
		if !stateContext.GetBoolParameter(n"isLocomotionInputHintDisplayed", true) {
			this.ShowGenericExplorationInputHints(stateContext, scriptInterface);
		}
	} else {
		if stateContext.GetBoolParameter(n"isLocomotionInputHintDisplayed", true) {
			this.RemoveGenericExplorationInputHints(stateContext, scriptInterface);
		}
	}

    this.m_hasControllerChanged = this.ConsumeControllerChange(stateContext, scriptInterface);
    this.m_hasControllerSchemeChanged = this.ConsumeInputSchemeChange();

    context = this.UpdateLocomotionInputHints(stateContext, scriptInterface);
    if (Equals(context, ActiveBaseContext.None)) {
		context = this.UpdateLadderInputHints(stateContext, scriptInterface);
    };

    if (Equals(context, ActiveBaseContext.None)) {
		context = this.UpdateSwimmingInputHints(stateContext, scriptInterface);
    };

    if (Equals(context, ActiveBaseContext.None)) {
		context = this.UpdateBodyCarryInputHints(stateContext, scriptInterface);
    };

    if (Equals(context, ActiveBaseContext.None) || Equals(context, ActiveBaseContext.BodyCarring)) {
		contextTemp = this.UpdateWeaponInputHints(stateContext, scriptInterface);
		context = NotEquals(contextTemp, ActiveBaseContext.None) ? contextTemp : context;
    };

    this.SetBaseContextInputHints(context, stateContext, scriptInterface);
}

@addMethod(InputContextTransitionEvents)
protected final func ShowInkPlaygroundPopupInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) {
	let localization = LocalizationSystem.GetInstance(scriptInterface.GetGame());
	let actionLabel = localization.GetText("InkPlayground-Action-Label");

	this.ShowInputHint(scriptInterface, n"Choice2_Hold", n"InkPlaygroundPopup", actionLabel, inkInputHintHoldIndicationType.Hold, true);

	stateContext.SetPermanentBoolParameter(n"isInkPlaygroundPopupInputHintDisplayed", true, true);
}

@addMethod(InputContextTransitionEvents)
protected final func RemoveInkPlaygroundPopupInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) {
	this.RemoveInputHintsBySource(scriptInterface, n"InkPlaygroundPopup");

	stateContext.RemovePermanentBoolParameter(n"isInkPlaygroundPopupInputHintDisplayed");
}

@wrapMethod(InputContextTransitionEvents)
protected final func RemoveAllInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) {
	this.RemoveInkPlaygroundPopupInputHints(stateContext, scriptInterface);
	wrappedMethod(stateContext, scriptInterface);
}

@wrapMethod(gameuiInGameMenuGameController)
private final func RegisterInputListenersForPlayer(playerPuppet: ref<GameObject>) {
	wrappedMethod(playerPuppet);

	if playerPuppet.IsControlledByLocalPeer() {
		playerPuppet.RegisterInputListener(this, n"Choice2_Hold");
	}
}

@wrapMethod(gameuiInGameMenuGameController)
protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) {
	wrappedMethod(action, consumer);

	let actionName = ListenerAction.GetName(action);
	let actionType = ListenerAction.GetType(action);

	if Equals(actionName, n"Choice2_Hold") && Equals(actionType, gameinputActionType.BUTTON_HOLD_COMPLETE) {
		let player = this.GetPlayerControlledObject() as PlayerPuppet;
		let blackboard = player.GetPlayerStateMachineBlackboard();
		let state = IntEnum<gamePSMVehicle>(blackboard.GetInt(GetAllBlackboardDefs().PlayerStateMachine.Vehicle));

		if NotEquals(state, gamePSMVehicle.Default) {
		    return;
		}

		if !Codeware.Require("1.1.4") {
		    LogChannel(n"DEBUG", "InkPLayground requires Codeware 1.1.4");
		    return;
		}

		InkPlaygroundPopup.Show(this);
        ListenerActionConsumer.DontSendReleaseEvent(consumer);
	}
}
