module InkPlayground.Practices
import InkPlayground.Workbench.Practice
import Codeware.UI.*

public class InputText extends Practice {
	protected let m_group: ref<inkWidget>;
	protected let m_input: ref<TextInput>;

	protected cb func OnCreate() {
		let root = new inkCanvas();
		root.SetName(this.GetClassName());
		root.SetAnchor(inkEAnchor.Fill);

		let group = new inkVerticalPanel();
		group.SetName(n"group");
		group.SetAnchor(inkEAnchor.BottomCenter);
		group.SetAnchorPoint(new Vector2(0.5, 1.0));
		group.SetMargin(new inkMargin(8.0, 0.0, 8.0, 48.0));
		group.Reparent(root);

		let label = new inkText();
		label.SetName(n"label");
		label.SetText(this.GetLocalizedText("InkPlayground-InputText-Input-Label"));
		label.SetFontFamily("base\\gameplay\\gui\\fonts\\orbitron\\orbitron.inkfontfamily");
		label.SetFontStyle(n"Regular");
		label.SetFontSize(25);
		label.SetLetterCase(textLetterCase.UpperCase);
		label.SetTintColor(ThemeColors.Bittersweet());
		label.SetMargin(new inkMargin(0.0, 0.0, 0.0, 4.0));
		label.Reparent(group);

		let input = HubTextInput.Create();
		input.SetText("We can type things now! WEEEEE!!");
		input.Reparent(group);

		this.m_group = group;
		this.m_input = input;

		this.SetRootWidget(root);
	}

	protected cb func OnInitialize() {
		this.Log(this.GetLocalizedText("InkPlayground-InputText-Event-Ready"));
	}
}
