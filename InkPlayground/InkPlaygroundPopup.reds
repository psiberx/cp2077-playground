module InkPlayground
import InkPlayground.Workbench.*
import InkPlayground.Practices.*
import Codeware.Localization.*
import Codeware.UI.*

public class InkPlaygroundPopup extends InGamePopup {
	protected let m_header: ref<InGamePopupHeader>;
	protected let m_footer: ref<InGamePopupFooter>;
	protected let m_content: ref<InGamePopupContent>;
	protected let m_workbench: ref<Workbench>;
	protected let m_translator: ref<LocalizationSystem>;

	protected cb func OnCreate() {
		super.OnCreate();

		this.m_translator = LocalizationSystem.GetInstance(this.GetGame());

		this.m_container.SetHeight(1040.0);

		this.m_header = InGamePopupHeader.Create();
		this.m_header.SetTitle(this.m_translator.GetText("InkPlayground-Popup-Title"));
		this.m_header.SetFluffRight(this.m_translator.GetText("InkPlayground-Popup-Fluff-Right"));
		this.m_header.Reparent(this);

		this.m_footer = InGamePopupFooter.Create();
		this.m_footer.SetFluffIcon(n"fluff_triangle2");
		this.m_footer.SetFluffText(this.m_translator.GetText("InkPlayground-Popup-Fluff-Bottom"));
		this.m_footer.Reparent(this);

		this.m_content = InGamePopupContent.Create();
		this.m_content.Reparent(this);

		this.m_workbench = Workbench.Create();
		this.m_workbench.SetSize(this.m_content.GetSize());
		this.m_workbench.SetTranslator(this.m_translator);
		this.m_workbench.Reparent(this.m_content);

		this.m_workbench.AddPractice(new ColorPalette());
		this.m_workbench.AddPractice(new ButtonBasics());
		this.m_workbench.AddPractice(new DragImage());
		this.m_workbench.AddPractice(new CursorState());
		this.m_workbench.AddPractice(new InputText());
	}

	protected cb func OnInitialize() {
		super.OnInitialize();

		this.m_workbench.SetHints(this.m_footer.GetHints());
	}

	public func UseCursor() -> Bool {
		return true;
	}

	public static func Show(requester: ref<inkGameController>) {
		let popup = new InkPlaygroundPopup();

		// Pass popup options
		//popup.SetOption1(param1);

		popup.Open(requester);
	}
}
