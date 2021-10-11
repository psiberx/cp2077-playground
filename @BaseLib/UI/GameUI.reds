// -----------------------------------------------------------------------------
// GameUI Static Helper
// -----------------------------------------------------------------------------

module BaseLib

public abstract class GameUI {
	public static func GetButtonHintsManager() -> ref<IButtonHintsManager> = ButtonHintsManager.GetInstance()
	public static func GetPopupsManager() -> ref<ICustomPopupManager> = CustomPopupManager.GetInstance()
}
