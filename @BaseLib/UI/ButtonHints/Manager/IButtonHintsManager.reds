// -----------------------------------------------------------------------------
// IButtonHintsManager
// -----------------------------------------------------------------------------

module BaseLib

public abstract class IButtonHintsManager {
	public func SpawnButtonHints(parentWidget: wref<inkWidget>) -> ref<ButtonHintsEx>
}
