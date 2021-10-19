// -----------------------------------------------------------------------------
// ButtonHintsManager
// -----------------------------------------------------------------------------
//
// public class ButtonHintsManager {
//   public func IsInitialized() -> Bool
//   public func Initialize(buttonHints: ref<inkWidget>) -> Void
//   public func SpawnButtonHints(parentWidget: wref<inkWidget>) -> ref<ButtonHintsEx>
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

@wrapMethod(SingleplayerMenuGameController)
protected cb func OnInitialize() -> Bool {
	wrappedMethod();

	ButtonHintsManager.GetInstance().Initialize(
		this.SpawnFromExternal(this.GetRootWidget(), r"base\\gameplay\\gui\\common\\buttonhints.inkwidget", n"Root")
	);
}
