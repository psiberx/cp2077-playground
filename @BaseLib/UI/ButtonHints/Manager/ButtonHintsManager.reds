// -----------------------------------------------------------------------------
// ButtonHintsManager
// -----------------------------------------------------------------------------
//
// public class ButtonHintsManager {
//   public func IsInitialized() -> Bool
//   public func Initialize(buttonHints: ref<inkWidget>) -> Void
//   public func SpawnButtonHints(parentWidget: wref<inkWidget>) -> ref<ButtonHintsEx>
//   public static func GetInstance(game: GameInstance) -> ref<ButtonHintsManager>
//   public static func GetInstance() -> ref<ButtonHintsManager>
// }
//

module BaseLib

public class ButtonHintsManager extends IButtonHintsManager {
	private let m_buttonHints: ref<inkWidget>;

	public func IsInitialized() -> Bool {
		return IsDefined(this.m_buttonHints);
	}

	public func Initialize(buttonHints: ref<inkWidget>) -> Void {
		this.m_buttonHints = buttonHints;
	}

	public func SpawnButtonHints(parentWidget: wref<inkWidget>) -> ref<ButtonHintsEx> {
		return ButtonHintsEx.Wrap(
			this.m_buttonHints.GetController().SpawnFromLocal(parentWidget, n"Root")
		);
	}

	public static func GetInstance(game: GameInstance) -> ref<ButtonHintsManager> {
		let registry: ref<RegistrySystem> = RegistrySystem.GetInstance(game);
		let instance: ref<ButtonHintsManager> = registry.Get(n"BaseLib.ButtonHintsManager") as ButtonHintsManager;

		if !IsDefined(instance) {
			instance = new ButtonHintsManager();
			registry.Put(instance);
		}

		return instance;
	}

	public static func GetInstance() -> ref<ButtonHintsManager> {
		return ButtonHintsManager.GetInstance(GetGameInstance());
	}

	public static func InitializeFromController(controller: ref<inkGameController>) -> Void {
		let rootWidget: ref<inkCompoundWidget> = controller.GetRootCompoundWidget();
		let buttonHints: ref<inkWidget> = controller.SpawnFromExternal(rootWidget, r"base\\gameplay\\gui\\common\\buttonhints.inkwidget", n"Root");

		let game: GameInstance = controller.GetPlayerControlledObject().GetGame();
		let instance: ref<ButtonHintsManager> = ButtonHintsManager.GetInstance(game);

		instance.Initialize(buttonHints);

		rootWidget.RemoveChild(buttonHints);
	}
}

// -----------------------------------------------------------------------------

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnInitialize() -> Bool {
	wrappedMethod();

	ButtonHintsManager.InitializeFromController(this);
}

@wrapMethod(DpadWheelGameController)
protected cb func OnInitialize() -> Bool {
	wrappedMethod();

	ButtonHintsManager.InitializeFromController(this);
}
