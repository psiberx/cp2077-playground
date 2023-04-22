module CodexFilter

@addField(CodexListVirtualNestedDataView)
public let m_currentTextFilter: String;

@addMethod(CodexListVirtualNestedDataView)
public final func SetTextFilter(filterTerm: String) -> Void {
	this.m_currentTextFilter = filterTerm;

	ArrayClear(this.m_toggledLevels);

	this.Filter();
	this.EnableSorting();
	this.Sort();
	this.DisableSorting();
}

@wrapMethod(CodexListVirtualNestedDataView)
protected func FilterItems(data: ref<VirutalNestedListData>) -> Bool {
	if !wrappedMethod(data) {
		return false;
	}

	if UTF8StrLen(this.m_currentTextFilter) == 0 {
		return true;
	}

	if data.m_isHeader {
		return false;
	}

	let entryData = data.m_data as CodexEntryData;

	return CodexFilter.Match(entryData, this.m_currentTextFilter);
}
