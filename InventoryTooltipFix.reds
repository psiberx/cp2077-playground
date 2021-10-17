// -----------------------------------------------------------------------------
// Inventory Tooltip Fix
// -----------------------------------------------------------------------------

@wrapMethod(gameuiTooltipsManager)
public final func ShowTooltipAtWidget(tooltipController: wref<AGenericTooltipController>, widget: wref<inkWidget>, tooltipData: ref<ATooltipData>, opt placement: gameuiETooltipPlacement, opt playAnim: Bool, opt margin: inkMargin) -> Void {
	wrappedMethod(tooltipController, widget, tooltipData, placement, false, margin);

	inkWidgetRef.SetVisible(this.GetTooltipsContainerRef(), true);
}

@wrapMethod(gameuiTooltipsManager)
public final func ShowTooltips(tooltipData: array<ref<ATooltipData>>, margin: inkMargin, opt playAnim: Bool) -> Void {
	wrappedMethod(tooltipData, margin, false);

	inkWidgetRef.SetVisible(this.GetTooltipsContainerRef(), true);
}
