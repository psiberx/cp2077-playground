module CodexFilter

public abstract class CodexFilter {
	public static func Match(entryData: ref<CodexEntryData>, searchTerm: String) -> Bool {
		return StrFindFirst(UTF8StrUpper(GetLocalizedText(entryData.m_title)), UTF8StrUpper(searchTerm)) >= 0;
	}
}
