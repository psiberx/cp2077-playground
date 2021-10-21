// -----------------------------------------------------------------------------
// ModLocalizationPackage
// -----------------------------------------------------------------------------
//
// Purpose:
// - Define translations (screen texts, subtitles)
//
// -----------------------------------------------------------------------------
//
// public abstract class ModLocalizationPackage {
//   protected func DefineTexts() -> Void
//   protected func DefineSubtitles() -> Void
//   protected func Text(key: String, value: String) -> Void
//   protected func Text(key: String, valueF: String, valueM: String) -> Void
//   protected func TextF(key: String, value: String) -> Void
//   protected func TextM(key: String, value: String) -> Void
//   protected func Subtitle(key: String, value: String) -> Void
//   protected func Subtitle(key: String, valueF: String, valueM: String) -> Void
//   protected func SubtitleF(key: String, value: String) -> Void
//   protected func SubtitleM(key: String, value: String) -> Void
// }
//

module BaseLib.Localization

public abstract class ModLocalizationPackage {
	private let m_screenEntries: ref<inkHashMap>;

	private let m_subtitleEntries: ref<inkHashMap>;

	public func GetEntries(type: EntryType) -> wref<inkHashMap> {
		switch type {
			case EntryType.Screen:
				if !IsDefined(this.m_screenEntries) {
					this.m_screenEntries = new inkHashMap();
					this.DefineTexts();
				}
				return this.m_screenEntries;

			case EntryType.Subtitle:
				if !IsDefined(this.m_subtitleEntries) {
					this.m_subtitleEntries = new inkHashMap();
					this.DefineSubtitles();
				}
				return this.m_subtitleEntries;

			default: return null;
		}
	}

	protected func DefineTexts() -> Void

	protected func DefineSubtitles() -> Void

	protected func Text(key: String, value: String) -> Void {
		let hash: Uint64 = LocalizationEntry.Hash(key);
		let entry: ref<GenderNeutralEntry> = this.m_screenEntries.Get(hash) as GenderNeutralEntry;

		if !IsDefined(entry) {
			entry = GenderNeutralEntry.Create(key);

			this.m_screenEntries.Insert(hash, entry);
		}

		entry.SetVariant(PlayerGender.Default, value);
	}

	protected func Text(key: String, valueF: String, valueM: String) -> Void {
		let hash: Uint64 = LocalizationEntry.Hash(key);
		let entry: ref<GenderSensitiveEntry> = this.m_screenEntries.Get(hash) as GenderSensitiveEntry;

		if !IsDefined(entry) {
			entry = GenderSensitiveEntry.Create(key);

			this.m_screenEntries.Insert(hash, entry);
		}

		entry.SetVariant(PlayerGender.Female, valueF);
		entry.SetVariant(PlayerGender.Male, valueM);
	}

	protected func TextF(key: String, value: String) -> Void {
		let hash: Uint64 = LocalizationEntry.Hash(key);
		let entry: ref<GenderSensitiveEntry> = this.m_screenEntries.Get(hash) as GenderSensitiveEntry;

		if !IsDefined(entry) {
			entry = GenderSensitiveEntry.Create(key);

			this.m_screenEntries.Insert(hash, entry);
		}

		entry.SetVariant(PlayerGender.Female, value);
	}

	protected func TextM(key: String, value: String) -> Void {
		let hash: Uint64 = LocalizationEntry.Hash(key);
		let entry: ref<GenderSensitiveEntry> = this.m_screenEntries.Get(hash) as GenderSensitiveEntry;

		if !IsDefined(entry) {
			entry = GenderSensitiveEntry.Create(key);

			this.m_screenEntries.Insert(hash, entry);
		}

		entry.SetVariant(PlayerGender.Male, value);
	}

	protected func Subtitle(key: String, value: String) -> Void {
		let hash: Uint64 = LocalizationEntry.Hash(key);
		let entry: ref<GenderNeutralEntry> = this.m_subtitleEntries.Get(hash) as GenderNeutralEntry;

		if !IsDefined(entry) {
			entry = GenderNeutralEntry.Create(key);

			this.m_subtitleEntries.Insert(hash, entry);
		}

		entry.SetVariant(PlayerGender.Default, value);
	}

	protected func Subtitle(key: String, valueF: String, valueM: String) -> Void {
		let hash: Uint64 = LocalizationEntry.Hash(key);
		let entry: ref<GenderSensitiveEntry> = this.m_subtitleEntries.Get(hash) as GenderSensitiveEntry;

		if !IsDefined(entry) {
			entry = GenderSensitiveEntry.Create(key);

			this.m_subtitleEntries.Insert(hash, entry);
		}

		entry.SetVariant(PlayerGender.Female, valueF);
		entry.SetVariant(PlayerGender.Male, valueM);
	}

	protected func Subtitle(key: String, value: String) -> Void {
		let hash: Uint64 = LocalizationEntry.Hash(key);
		let entry: ref<GenderSensitiveEntry> = this.m_subtitleEntries.Get(hash) as GenderSensitiveEntry;

		if !IsDefined(entry) {
			entry = GenderSensitiveEntry.Create(key);

			this.m_subtitleEntries.Insert(hash, entry);
		}

		entry.SetVariant(PlayerGender.Female, value);
	}

	protected func SubtitleM(key: String, value: String) -> Void {
		let hash: Uint64 = LocalizationEntry.Hash(key);
		let entry: ref<GenderSensitiveEntry> = this.m_subtitleEntries.Get(hash) as GenderSensitiveEntry;

		if !IsDefined(entry) {
			entry = GenderSensitiveEntry.Create(key);

			this.m_subtitleEntries.Insert(hash, entry);
		}

		entry.SetVariant(PlayerGender.Male, value);
	}
}
