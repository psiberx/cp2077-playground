module InkPlayground.Workbench
import Codeware.Localization.*
import Codeware.UI.*

public abstract class Practice extends inkCustomController {
	protected let m_name: String;

	protected let m_workbench: wref<Workbench>;

	protected let m_container: wref<inkCanvas>;

	protected cb func OnAssign() -> Void {
		let namespace: String;
		StrSplitLast(NameToString(this.GetClassName()), ".", namespace, this.m_name);
	}

	protected cb func OnCreate() -> Void {
		let root: ref<inkCanvas> = new inkCanvas();
		root.SetName(this.GetClassName());
		root.SetAnchor(inkEAnchor.Fill);

		this.SetRootWidget(root);
	}

	protected func GetAreaSize() -> Vector2 {
		return this.m_workbench.GetSize();
	}

	protected func GetLocalizedText(key: String) -> String {
		return this.m_workbench.GetTranslator().GetText(key);
	}

	protected func UpdateHint(action: CName, label: String, active: Bool) -> Void {
		if active {
			this.m_workbench.GetHints().AddButtonHint(action, label);
		} else {
			this.m_workbench.GetHints().RemoveButtonHint(action);
		}
	}

	protected func UpdateHint(action: CName, label: String) -> Void {
		this.m_workbench.GetHints().AddButtonHint(action, label);
	}

	protected func UpdateHoldHint(action: CName, label: String, active: Bool) -> Void {
		if active {
			this.m_workbench.GetHints().AddButtonHint(action, "[" + GetLocalizedText("LocKey#565") + "] " + label);
		} else {
			this.m_workbench.GetHints().RemoveButtonHint(action);
		}
	}

	protected func UpdateHoldHint(action: CName, label: String) -> Void {
		this.m_workbench.GetHints().AddButtonHint(action, "[" + GetLocalizedText("LocKey#565") + "] " + label);
	}

	protected func RemoveHint(action: CName) -> Void {
		this.m_workbench.GetHints().RemoveButtonHint(action);
	}

	protected func LockHints() -> Void {
		this.m_workbench.GetHints().Lock();
	}

	protected func UnlockHints() -> Void {
		this.m_workbench.GetHints().Unlock();
	}

	protected func Log(entry: String) -> Void {
		this.m_workbench.GetJournal().AddEntry("[" + this.m_name + "] " + entry);
	}

	protected func Trigger(event: CName) -> Void {
		this.m_workbench.CallCustomCallback(event);
	}

	public func Assign(workbench: ref<Workbench>) -> Void {
		this.m_workbench = workbench;
		this.m_container = this.m_workbench.GetContainer();

		this.OnAssign();

		this.Reparent(this.m_workbench);
	}
}
