module CodexFilter
import Codeware.UI.*

@addField(CodexGameController)
private let m_filterInput: ref<HubTextInput>;

@wrapMethod(CodexGameController)
protected cb func OnInitialize() -> Bool {
	wrappedMethod();

	// wrapper/layout_wrapper/LeftBlock/LeftBlockWrapper/CategoryContainer
	let filterPanel = inkWidgetRef.Get(this.m_filtersContainer) as inkHorizontalPanel;

	this.m_filterInput = new HubTextInput();
	this.m_filterInput.Reparent(filterPanel, this);
	this.m_filterInput.SetLetterCase(textLetterCase.UpperCase);
	this.m_filterInput.SetDefaultText(GetLocalizedText("LocKey#48662"));
	this.m_filterInput.RegisterToCallback(n"OnInput", this, n"OnFilterInput");

	this.RegisterToGlobalInputCallback(n"OnPostOnRelease", this, n"OnGlobalInput");
}

@wrapMethod(CodexGameController)
protected cb func OnUninitialize() -> Bool {
	wrappedMethod();

	this.UnregisterFromGlobalInputCallback(n"OnPostOnRelease", this, n"OnGlobalInput");
}

@addMethod(CodexGameController)
protected cb func OnFilterInput(widget: wref<inkWidget>) -> Bool {
	this.m_listController.SetTextFilter(this.m_filterInput.GetText());
}

@addMethod(CodexGameController)
protected cb func OnGlobalInput(evt: ref<inkPointerEvent>) -> Void {
	if evt.IsAction(n"mouse_left") {
		if !IsDefined(evt.GetTarget()) || !evt.GetTarget().CanSupportFocus() {
			this.RequestSetFocus(null);
		}
	}
}
