module InkPlayground.Workbench

public abstract class Practice extends inkCustomController {
	protected let m_workbench: wref<Workbench>;

	protected let m_container: wref<inkCanvas>;

	protected cb func OnAssign() -> Void

	protected cb func OnCreate() -> Void {
		let root: ref<inkCanvas> = new inkCanvas();
		root.SetName(this.GetClassName());
		root.SetAnchor(inkEAnchor.Fill);

		this.SetRootWidget(root);
	}

	protected func Log(entry: String) -> Void {
		this.m_workbench.GetJournal().AddEntry(entry);
	}

	protected func Trigger(event: CName) -> Void {
		this.m_workbench.CallCustomCallback(event);
	}

	protected func GetAreaSize() -> Vector2 {
		return this.m_workbench.GetSize();
	}

	public func Assign(workbench: ref<Workbench>) -> Void {
		this.m_workbench = workbench;
		this.m_container = this.m_workbench.GetContainer();

		this.OnAssign();

		this.Reparent(this.m_workbench);
	}
}
