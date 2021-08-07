// -----------------------------------------------------------------------------
// InGamePopupFooter
// -----------------------------------------------------------------------------

public class InGamePopupFooter extends inkCustomController {
	protected let m_fluffIcon: wref<inkImage>;

	protected let m_fluffText: wref<inkText>;

	protected cb func OnCreate() -> Void {
		let footer: ref<inkCanvas> = new inkCanvas();
		footer.SetName(n"footer");
		footer.SetAnchor(inkEAnchor.BottomFillHorizontaly);

		let line: ref<inkRectangle> = new inkRectangle();
		line.SetName(n"line");
		line.SetMargin(new inkMargin(76.0, 0.0, 76.0, 90.0));
		line.SetAnchor(inkEAnchor.BottomFillHorizontaly);
		line.SetAnchorPoint(new Vector2(0.5, 0.5));
		line.SetOpacity(0.133);
		line.SetTintColor(ThemeColors.Bittersweet());
		line.SetSize(new Vector2(1170.0, 2.0));
		line.SetRenderTransformPivot(new Vector2(0.0, 0.5));
		line.Reparent(footer);

		let fluffIcon: ref<inkImage> = new inkImage();
		fluffIcon.SetName(n"fluffIcon");
		fluffIcon.SetVisible(false);
		fluffIcon.SetAtlasResource(r"base\\gameplay\\gui\\widgets\\scanning\\scanner_tooltip\\atlas_scanner.inkatlas");
		fluffIcon.SetFitToContent(true);
		fluffIcon.SetMargin(new inkMargin(76.0, 0.0, 0.0, 10.0));
		fluffIcon.SetHAlign(inkEHorizontalAlign.Center);
		fluffIcon.SetVAlign(inkEVerticalAlign.Center);
		fluffIcon.SetAnchor(inkEAnchor.BottomLeft);
		fluffIcon.SetAnchorPoint(new Vector2(0.0, 1.0));
		fluffIcon.SetOpacity(0.217);
		fluffIcon.SetTintColor(new HDRColor(1.1761, 0.3809, 0.3476, 1.0));
		fluffIcon.SetSize(new Vector2(32.0, 32.0));
		fluffIcon.Reparent(footer);

		let fluffText: ref<inkText> = new inkText();
		fluffText.SetName(n"fluffText");
		fluffText.SetVisible(false);
		fluffText.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
		fluffText.SetFontStyle(n"Regular");
		fluffText.SetFontSize(20);
		fluffText.SetFitToContent(true);
		fluffText.SetMargin(new inkMargin(135.0, 0.0, 0.0, 75.0));
		fluffText.SetAnchor(inkEAnchor.BottomLeft);
		fluffText.SetTintColor(new HDRColor(1.1761, 0.3809, 0.3476, 1.0));
		fluffText.SetSize(new Vector2(100.0, 32.0));
		fluffText.Reparent(footer);

		let inputHints: ref<inkHorizontalPanel> = new inkHorizontalPanel();
		inputHints.SetName(n"inputHints");
		inputHints.SetInteractive(true);
		inputHints.SetFitToContent(true);
		inputHints.SetHAlign(inkEHorizontalAlign.Right);
		inputHints.SetAnchor(inkEAnchor.BottomRight);
		inputHints.SetAnchorPoint(new Vector2(1.0, 1.0));
		inputHints.SetRenderTransformPivot(new Vector2(1.0, 1.0));
		inputHints.SetMargin(new inkMargin(0.0, 0.0, 32.0, 0.0));
		inputHints.Reparent(footer);

		let inputClose: ref<inkHorizontalPanel> = new inkHorizontalPanel();
		inputClose.SetName(n"inputClose");
		inputClose.SetFitToContent(true);
		inputClose.Reparent(inputHints);

		let inputDisplayController: ref<inkHorizontalPanel> = new inkHorizontalPanel();
		inputDisplayController.SetName(n"inputDisplayController");
		inputDisplayController.SetAffectsLayoutWhenHidden(true);
		inputDisplayController.SetFitToContent(true);
		inputDisplayController.SetHAlign(inkEHorizontalAlign.Center);
		inputDisplayController.SetVAlign(inkEVerticalAlign.Center);
		inputDisplayController.SetSize(new Vector2(40.0, 32.0));
		inputDisplayController.Reparent(inputClose);

		let inputRoot: ref<inkCanvas> = new inkCanvas();
		inputRoot.SetName(n"inputRoot");
		inputRoot.SetHAlign(inkEHorizontalAlign.Left);
		inputRoot.SetVAlign(inkEVerticalAlign.Top);
		inputRoot.SetSize(new Vector2(64.0, 64.0));
		inputRoot.Reparent(inputDisplayController);

		let inputIcon: ref<inkImage> = new inkImage();
		inputIcon.SetName(n"inputIcon");
		inputIcon.SetAtlasResource(r"base\\gameplay\\gui\\common\\input\\icons_keyboard.inkatlas");
		inputIcon.SetTexturePart(n"kb_c");
		inputIcon.SetAffectsLayoutWhenHidden(true);
		inputIcon.SetHAlign(inkEHorizontalAlign.Center);
		inputIcon.SetVAlign(inkEVerticalAlign.Center);
		inputIcon.SetAnchor(inkEAnchor.Centered);
		inputIcon.SetAnchorPoint(new Vector2(0.5, 0.5));
		inputIcon.SetTintColor(ThemeColors.ElectricBlue());
		inputIcon.SetSize(new Vector2(64.0, 64.0));
		inputIcon.Reparent(inputRoot);

		let text: ref<inkText> = new inkText();
		text.SetName(n"text");
		text.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
		text.SetFontStyle(n"Semi-Bold");
		text.SetFontSize(38);
		text.SetLetterCase(textLetterCase.UpperCase);
		text.SetScrollTextSpeed(0.2);
		text.SetLocalizedTextString("LocKey#22195");
		text.SetFitToContent(true);
		text.SetMargin(new inkMargin(5.0, 0.0, 0.0, 0.0));
		text.SetVAlign(inkEVerticalAlign.Center);
		text.SetTintColor(ThemeColors.Bittersweet());
		text.SetSize(new Vector2(100.0, 32.0));
		text.Reparent(inputClose);

		this.m_fluffIcon = fluffIcon;
		this.m_fluffText = fluffText;

		this.SetRootWidget(footer);
	}

	public func SetFluffIcon(icon: CName) -> Void {
		this.m_fluffIcon.SetTexturePart(icon);
		this.m_fluffIcon.SetVisible(true);
	}

	public func SetFluffIcon(icon: CName, atlas: ResRef) -> Void {
		this.m_fluffIcon.SetAtlasResource(atlas);
		this.m_fluffIcon.SetTexturePart(icon);
		this.m_fluffIcon.SetVisible(true);
	}

	public func SetFluffText(text: String) -> Void {
		this.m_fluffText.SetText(text);
		this.m_fluffText.SetVisible(true);
	}

	public static func Create() -> ref<InGamePopupFooter> {
		let instance: ref<InGamePopupFooter> = new InGamePopupFooter();
		instance.Build();

		return instance;
	}
}
