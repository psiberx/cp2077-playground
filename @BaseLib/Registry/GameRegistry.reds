// -----------------------------------------------------------------------------
// GameRegistry
// -----------------------------------------------------------------------------
//
// - Global object registry / singleton container
// - Game instance resolver
//
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
		return GetAllBlackboardDefs().DebugData.GameInstance;
	}

	public static func Get(name: CName) -> ref<IScriptable> {
		let container: ref<inkHashMap> = GameRegistry.GetContainer();
		let key: Uint64 = CRC32L.Hash(name);

		return container.Get(key);
	}

	public static func Put(name: CName, instance: ref<IScriptable>) -> Void {
		let container: ref<inkHashMap> = GameRegistry.GetContainer();
		let key: Uint64 = CRC32L.Hash(name);

		if container.KeyExist(key) {
			container.Set(key, instance);
		} else {
			container.Insert(key, instance);
		}
	}

	public static func Put(instance: ref<IScriptable>) -> Void {
		GameRegistry.Put(instance.GetClassName(), instance);
	}

	public static func Remove(name: CName) -> Void {
		let container: ref<inkHashMap> = GameRegistry.GetContainer();
		let key: Uint64 = CRC32L.Hash(name);

		if container.KeyExist(key) {
			container.Remove(key);
		}
	}

	public static func Remove(instance: ref<IScriptable>) -> Void {
		GameRegistry.Remove(instance.GetClassName());
	}

	private static func GetContainer() -> ref<inkHashMap> {
		let container: ref<inkHashMap> = GetAllBlackboardDefs().DebugData.GameRegistryData;

		if !IsDefined(container) {
			container = new inkHashMap();
			GetAllBlackboardDefs().DebugData.GameRegistryData = container;
		}

		return container;
	}
}

// -----------------------------------------------------------------------------

@addField(DebugDataDef)
public let GameRegistryData: ref<inkHashMap>;

@addField(DebugDataDef)
public let GameInstance: GameInstance;

@wrapMethod(ScriptableSystem)
private func OnAttach() -> Void {
	wrappedMethod();
	GetAllBlackboardDefs().DebugData.GameInstance = this.GetGameInstance();
}
