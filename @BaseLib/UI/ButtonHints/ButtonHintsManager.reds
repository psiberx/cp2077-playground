// -----------------------------------------------------------------------------
// ButtonHintsManager
// -----------------------------------------------------------------------------

module BaseLib

public class ButtonHintsManager extends IButtonHintsManager {

	public static func GetInstance() -> ref<ButtonHintsManager> {
		let instance = GameRegistry.Get(n"BaseLib.ButtonHintsManager") as ButtonHintsManager;

		if !IsDefined(instance) {
			instance = new ButtonHintsManager();
			GameRegistry.Put(instance);
		}

		return instance;
	}
}

// -----------------------------------------------------------------------------

@addField(UISystem)
let buttonHints: ref<inkWidget>;

@addMethod(UISystem)
public func SpawnButtonHints(parentWidget: wref<inkWidget>) -> ref<ButtonHints> {
	return this.buttonHints.GetController().SpawnFromLocal(parentWidget, n"Root").GetController() as ButtonHints;
}

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnInitialize() -> Bool {
	wrappedMethod();

	let uiSystem: ref<UISystem> = GameInstance.GetUISystem(this.GetPlayerControlledObject().GetGame());
	uiSystem.buttonHints = this.SpawnFromExternal(this.GetRootWidget(), r"base\\gameplay\\gui\\common\\buttonhints.inkwidget", n"Root");
}
