module InkPlayground
import InkPlayground.Workbench.*
import InkPlayground.Practices.*

public class InkPlaygroundPopup extends InGamePopupController {
	protected let m_header: ref<InGamePopupHeader>;

	protected let m_footer: ref<InGamePopupFooter>;

	protected let m_content: ref<InGamePopupContent>;

	protected let m_workbench: ref<Workbench>;

	protected cb func OnCreate() -> Void {
		super.OnCreate();

		this.m_container.SetHeight(990.0);

		this.m_header = InGamePopupHeader.Create();
		this.m_header.SetTitle("Ink Playground");
		this.m_header.SetFluffRight("Build & Play With Ink Widgets");
		this.m_header.Reparent(this);

		this.m_footer = InGamePopupFooter.Create();
		this.m_footer.SetFluffIcon(n"fluff_triangle2");
		this.m_footer.SetFluffText(
			"This entire widget is 100% built from scratch using redscript.\n" +
			"There are no resued, wrapped or extended widgets.\n" +
			"Powered by Base Lib prototype."
		);
		this.m_footer.Reparent(this);

		this.m_content = InGamePopupContent.Create();
		this.m_content.Reparent(this);

		this.m_workbench = Workbench.Create();
		this.m_workbench.SetSize(this.m_content.GetSize());
		this.m_workbench.Reparent(this.m_content);

		this.m_workbench.AddPractice(new ColorPalette());
		this.m_workbench.AddPractice(new ButtonBasics());
		this.m_workbench.AddPractice(new DragImage());
		this.m_workbench.AddPractice(new CursorState());
	}

	protected cb func OnInitialize() -> Void {
		super.OnInitialize();

		this.m_workbench.SetHints(this.m_footer.GetHints());
	}

	public func UseCursor() -> Bool {
		return true;
	}

	public static func Show(requester: ref<inkGameController>) -> Void {
		let popup: ref<InkPlaygroundPopup> = new InkPlaygroundPopup();

		// Pass popup options
		//popup.SetOption1(param1);

		popup.Open(requester);
	}
}
