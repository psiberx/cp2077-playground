// -----------------------------------------------------------------------------
// Auto Continue
// -----------------------------------------------------------------------------
//
// - Automatically loads the last used save file on start
// - Can be turned off with the in-code setting
//

public static func AutoContine() -> Bool = true

@addField(DebugDataDef)
public let AutoContinueUsed: Bool;

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnSavesReady(saves: array<String>) -> Bool {
	wrappedMethod(saves);

	if this.m_savesCount > 0 && AutoContine() && !GetAllBlackboardDefs().DebugData.AutoContinueUsed {
		this.GetSystemRequestsHandler().LoadLastCheckpoint(false);
	}
}

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnUninitialize() -> Bool {
	wrappedMethod();

	GetAllBlackboardDefs().DebugData.AutoContinueUsed = true;
}
