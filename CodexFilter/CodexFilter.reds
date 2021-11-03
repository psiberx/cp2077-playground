module CodexFilter

public abstract class CodexFilter {
	public static func Match(entryData: ref<CodexEntryData>, searchTerm: String) -> Bool {
		return StrFindFirst(StrUpper(GetLocalizedText(entryData.m_title)), searchTerm) >= 0;
	}
}
