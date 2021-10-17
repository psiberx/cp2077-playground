// -----------------------------------------------------------------------------
// Auto Continue
// -----------------------------------------------------------------------------
//
// - Automatically loads the last used save file on start
// - Can be canceled by pressing ESC during startup (before the spinner)
// - TODO: Visual prompt for autoload canceling
//

@addField(DebugDataDef)
public let NoAutoContinue: Bool;

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnInitialize() -> Bool {
	this.RegisterToGlobalInputCallback(n"OnPostOnPress", this, n"OnGlobalPress");
	this.RegisterToGlobalInputCallback(n"OnPostOnHold", this, n"OnGlobalHold");

	wrappedMethod();
}

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnUninitialize() -> Bool {
	this.UnregisterFromGlobalInputCallback(n"OnPostOnPress", this, n"OnGlobalPress");
	this.UnregisterFromGlobalInputCallback(n"OnPostOnHold", this, n"OnGlobalHold");

	wrappedMethod();

	GetAllBlackboardDefs().DebugData.NoAutoContinue = true;
}

@addMethod(SingleplayerMenuGameController)
protected cb func OnGlobalPress(e: ref<inkPointerEvent>) -> Bool {
	GetAllBlackboardDefs().DebugData.NoAutoContinue = true;
}

@addMethod(SingleplayerMenuGameController)
protected cb func OnGlobalHold(e: ref<inkPointerEvent>) -> Bool {
	GetAllBlackboardDefs().DebugData.NoAutoContinue = true;
}

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnSavesReady(saves: array<String>) -> Bool {
	wrappedMethod(saves);

	if !GetAllBlackboardDefs().DebugData.NoAutoContinue && this.m_savesCount > 0 {
		this.GetSystemRequestsHandler().LoadLastCheckpoint(false);
	}
}
