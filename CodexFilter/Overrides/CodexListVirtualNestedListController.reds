module CodexFilter

@addMethod(CodexListVirtualNestedListController)
public final func SetTextFilter(filterTerm: String) -> Void {
	this.m_currentDataView.SetTextFilter(filterTerm);
}
