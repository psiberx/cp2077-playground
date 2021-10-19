// -----------------------------------------------------------------------------
// Registry System
// -----------------------------------------------------------------------------
//
// - Global object registry / singleton container
// - Global game instance resolver
//
// -----------------------------------------------------------------------------
//
// public class RegistrySystem extends ScriptableSystem {
//   public func Get(name: CName) -> ref<IScriptable>
//   public func Put(name: CName, instance: ref<IScriptable>) -> Void
//   public func Put(instance: ref<IScriptable>) -> Void
//   public func Remove(name: CName) -> Void
//   public func Remove(instance: ref<IScriptable>) -> Void
//   public static func GetInstance() -> ref<RegistrySystem>
// }
//

module BaseLib

public class RegistrySystem extends ScriptableSystem {
	private let m_container: ref<inkHashMap>;

	private func OnAttach() -> Void {
		this.m_container = new inkHashMap();
	}

	public func Get(name: CName) -> ref<IScriptable> {
		let key: Uint64 = CRC32L.Hash(name);

		return this.m_container.Get(key);
	}

	public func Put(name: CName, instance: ref<IScriptable>) -> Void {
		let key: Uint64 = CRC32L.Hash(name);

		if this.m_container.KeyExist(key) {
			this.m_container.Set(key, instance);
		} else {
			this.m_container.Insert(key, instance);
		}
	}

	public func Put(instance: ref<IScriptable>) -> Void {
		this.Put(instance.GetClassName(), instance);
	}

	public func Remove(name: CName) -> Void {
		let key: Uint64 = CRC32L.Hash(name);

		if this.m_container.KeyExist(key) {
			this.m_container.Remove(key);
		}
	}

	public func Remove(instance: ref<IScriptable>) -> Void {
		this.Remove(instance.GetClassName());
	}

	public static func GetInstance() -> ref<RegistrySystem> {
		return GameInstance.GetScriptableSystemsContainer(GetGameInstance()).Get(n"BaseLib.RegistrySystem") as RegistrySystem;
	}
}