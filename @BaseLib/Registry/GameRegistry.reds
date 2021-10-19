// -----------------------------------------------------------------------------
// GameRegistry Static Helper
// -----------------------------------------------------------------------------
//
// public class GameRegistry {
//   public static func GetGame() -> GameInstance
//   public static func Get(name: CName) -> ref<IScriptable>
//   public static func Put(name: CName, instance: ref<IScriptable>) -> Void
//   public static func Put(instance: ref<IScriptable>) -> Void
//   public static func Remove(name: CName) -> Void
//   public static func Remove(instance: ref<IScriptable>) -> Void
// }
//

module BaseLib

public class GameRegistry {
	public static func GetGame() -> GameInstance {
		return RegistrySystem.GetInstance().GetGameInstance();
	}

	public static func Get(name: CName) -> ref<IScriptable> {
		return RegistrySystem.GetInstance().Get(name);
	}

	public static func Put(name: CName, instance: ref<IScriptable>) -> Void {
		RegistrySystem.GetInstance().Put(name, instance);
	}

	public static func Put(instance: ref<IScriptable>) -> Void {
		RegistrySystem.GetInstance().Put(instance);
	}

	public static func Remove(name: CName) -> Void {
		RegistrySystem.GetInstance().Remove(name);
	}

	public static func Remove(instance: ref<IScriptable>) -> Void {
		RegistrySystem.GetInstance().Remove(instance);
	}
}
