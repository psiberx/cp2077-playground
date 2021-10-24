module InkPlayground.Practices
import InkPlayground.Workbench.Practice
import Codeware.UI.*

public class CursorState extends Practice {
	protected let m_state: ref<inkText>;

	protected let m_params: ref<inkTextParams>;

	protected cb func OnCreate() -> Void {
		let root: ref<inkFlex> = new inkFlex();
		root.SetName(this.GetClassName());
		root.SetAnchor(inkEAnchor.Fill);

		let state: ref<inkText> = new inkText();
		state.SetName(n"state");
		state.SetFontFamily("base\\gameplay\\gui\\fonts\\orbitron\\orbitron.inkfontfamily");
		state.SetFontStyle(n"Medium");
		state.SetFontSize(28);
		state.SetLetterCase(textLetterCase.UpperCase);
		state.SetHorizontalAlignment(textHorizontalAlignment.Right);
		state.SetTintColor(ThemeColors.Bittersweet());
		state.SetOpacity(0.6);
		state.SetFitToContent(true);
		state.SetAnchor(inkEAnchor.TopRight);
		state.SetHAlign(inkEHorizontalAlign.Right);
		state.SetMargin(new inkMargin(0.0, 16.0, 16.0, 0.0));
		state.Reparent(root);

		this.m_state = state;

		this.SetRootWidget(root);
	}

	protected cb func OnInitialize() -> Void {
		this.m_params = new inkTextParams();
		this.m_params.AddNumber("X", 0);
		this.m_params.AddNumber("Y", 0);
		this.m_state.SetText("{X} : {Y}", this.m_params);

		this.RegisterToGlobalInputCallback(n"OnPostOnRelative", this, n"OnCursorMove");

		this.Log(this.GetLocalizedText("InkPlayground-CursorState-Event-Ready"));
	}

	protected cb func OnUninitialize() -> Void {
		this.UnregisterFromGlobalInputCallback(n"OnPostOnRelative", this, n"OnCursorMove");
	}

	protected cb func OnCursorMove(evt: ref<inkPointerEvent>) -> Void {
		let position: Vector2 = evt.GetScreenSpacePosition();

		this.m_params.UpdateNumber("X", RoundF(position.X));
		this.m_params.UpdateNumber("Y", RoundF(position.Y));
	}
}
