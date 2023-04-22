// -----------------------------------------------------------------------------
// Extended Loot Icons
// -----------------------------------------------------------------------------
//
// Shows individual icons for weapons instead of generic loot icon.
//

@addField(GameplayRoleMappinData)
public let m_isItem: Bool;

@wrapMethod(GameplayRoleComponent)
private final func CreateRoleMappinData(data: SDeviceMappinData) -> ref<GameplayRoleMappinData> {
	let mappinData = wrappedMethod(data);

	if this.GetOwner().IsItem() && Equals(data.mappinVariant, gamedataMappinVariant.LootVariant) {
		let weaponObject = this.GetOwner() as WeaponObject;

		if IsDefined(weaponObject) {
			mappinData.m_isItem = true;
			mappinData.m_textureID = weaponObject.GetWeaponRecord().HudIcon().GetID();
		}
	}

	return mappinData;
}

@wrapMethod(GameplayMappinController)
private func UpdateIcon() -> Void {
	wrappedMethod();

	if IsDefined(this.m_mappin) {
		let mappinData = this.m_mappin.GetScriptData() as GameplayRoleMappinData;

		inkWidgetRef.SetScale(this.iconWidget, mappinData.m_isItem ? new Vector2(0.6, 0.6) : new Vector2(1.0, 1.0));
	}
}
