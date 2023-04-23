module InkPlayground.Workbench
import Codeware.Localization.*
import Codeware.UI.*

public class Workbench extends inkCustomController {
	protected let m_root: wref<inkFlex>;
	protected let m_container: wref<inkCanvas>;
	protected let m_journal: wref<Journal>;
	protected let m_buttonHints: wref<ButtonHintsEx>;
	protected let m_translator: wref<LocalizationSystem>;
	protected let m_areaSize: Vector2;

	protected cb func OnCreate() {
		let workbench = new inkFlex();
		workbench.SetName(n"workbench");
		workbench.SetAnchor(inkEAnchor.Fill);

		let background = new inkRectangle();
		background.SetAnchor(inkEAnchor.Fill);
		background.SetMargin(new inkMargin(8.0, 8.0, 8.0, 8.0));
		background.SetTintColor(ThemeColors.PureBlack());
		background.SetOpacity(0.217);
		background.Reparent(workbench);

		let pattern = new inkImage();
		pattern.SetName(n"pattern");
		pattern.SetAtlasResource(r"base\\gameplay\\gui\\fullscreen\\inventory\\atlas_inventory.inkatlas");
		pattern.SetTexturePart(n"BLUEPRINT_3slot");
		pattern.SetBrushTileType(inkBrushTileType.Both);
		pattern.SetTileHAlign(inkEHorizontalAlign.Center);
		pattern.SetTileVAlign(inkEVerticalAlign.Center);
		pattern.SetAnchor(inkEAnchor.Fill);
		pattern.SetOpacity(0.1);
		pattern.SetTintColor(ThemeColors.Bittersweet());
		pattern.SetMargin(new inkMargin(8.0, 4.0, 8.0, 2.0));
		pattern.Reparent(workbench);

		let frame = new inkImage();
		frame.SetName(n"frame");
		frame.SetAtlasResource(r"base\\gameplay\\gui\\fullscreen\\inventory\\inventory4_atlas.inkatlas");
		frame.SetTexturePart(n"itemGridFrame3Big");
		frame.SetNineSliceScale(true);
		frame.SetNineSliceGrid(new inkMargin(24, 24, 24, 24));
		frame.SetAnchor(inkEAnchor.Fill);
		frame.SetOpacity(0.5);
		frame.SetTintColor(ThemeColors.Bittersweet());
		frame.Reparent(workbench);

		let container = new inkCanvas();
		container.SetName(n"container");
		container.SetAnchor(inkEAnchor.Fill);
		container.Reparent(workbench);

		let journal = Journal.Create();
		journal.SetGameController(this);
		journal.Reparent(workbench);

		this.m_root = workbench;
		this.m_container = container;
		this.m_journal = journal;

		this.SetRootWidget(workbench);
		this.SetContainerWidget(container);
	}

	public func GetContainer() -> wref<inkCanvas> {
		return this.m_container;
	}

	public func GetJournal() -> wref<Journal> {
		return this.m_journal;
	}

	public func GetHints() -> wref<ButtonHintsEx> {
		return this.m_buttonHints;
	}

	public func GetTranslator() -> wref<LocalizationSystem> {
		return this.m_translator;
	}

	public func GetSize() -> Vector2 {
		return this.m_areaSize;
	}

	public func SetSize(areaSize: Vector2) {
		this.m_areaSize = areaSize;
	}

	public func SetHints(buttonHints: wref<ButtonHintsEx>) {
		this.m_buttonHints = buttonHints;
	}

	public func SetTranslator(localization: wref<LocalizationSystem>) {
		this.m_translator = localization;
	}

	public func AddPractice(practice: ref<Practice>) {
		practice.Assign(this);
	}

	public func Log(entry: String) {
		this.m_journal.AddEntry(entry);
	}

	public static func Create() -> ref<Workbench> {
		let self = new Workbench();
		self.CreateInstance();

		return self;
	}
}
