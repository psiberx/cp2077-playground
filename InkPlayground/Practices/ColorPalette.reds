module InkPlayground.Practices
import InkPlayground.Workbench.Practice
import Codeware.UI.*

public class ColorPalette extends Practice {
	protected let m_palette: ref<inkCompoundWidget>;

	protected cb func OnCreate() {
		let root = new inkFlex();
		root.SetName(this.GetClassName());
		root.SetAnchor(inkEAnchor.Fill);

		let palette = new inkVerticalPanel();
		palette.SetName(n"palette");
		palette.SetAnchor(inkEAnchor.CenterRight);
		palette.SetHAlign(inkEHorizontalAlign.Right);
		palette.SetVAlign(inkEVerticalAlign.Center);
		palette.SetMargin(new inkMargin(0.0, 0.0, 24.0, 0.0));
		palette.SetChildMargin(new inkMargin(0.0, 8.0, 0.0, 8.0));
		palette.Reparent(root);

		this.m_palette = palette;

		this.SetRootWidget(root);
	}

	protected cb func OnInitialize() {
		let index = 0;

		let palette = [
			ThemeColors.ElectricBlue(),
			ThemeColors.Bittersweet(),
			ThemeColors.Dandelion(),
			ThemeColors.LightGreen()
		];

		for color in palette {
			let item = new inkCircle();
			item.SetAffectsLayoutWhenHidden(true);
			item.SetSize(new Vector2(48.0, 48.0));
			item.SetSegmentsNumber(6u); // Hexagon
			item.SetRenderTransformPivot(new Vector2(0.5, 0.5));
			item.SetRotation(30.0);
			item.SetTintColor(color);
			item.SetOpacity(0.0);
			item.Reparent(this.m_palette);

			let scaleAnim = new inkAnimScale();
			scaleAnim.SetStartScale(new Vector2(0.6, 0.6));
			scaleAnim.SetEndScale(new Vector2(1.0, 1.0));
			scaleAnim.SetType(inkanimInterpolationType.Linear);
			scaleAnim.SetMode(inkanimInterpolationMode.EasyOut);
			scaleAnim.SetDuration(0.3);

			let alphaAnim = new inkAnimTransparency();
			alphaAnim.SetStartTransparency(0.0);
			alphaAnim.SetEndTransparency(1.0);
			alphaAnim.SetType(inkanimInterpolationType.Linear);
			alphaAnim.SetMode(inkanimInterpolationMode.EasyOut);
			alphaAnim.SetDuration(0.4);

			let animDef = new inkAnimDef();
			animDef.AddInterpolator(scaleAnim);
			animDef.AddInterpolator(alphaAnim);

			let animOpts: inkAnimOptions;
			animOpts.executionDelay = 0.15 + (0.1 * Cast<Float>(index));

			item.PlayAnimationWithOptions(animDef, animOpts);

			index += 1;
		}

		this.Log(this.GetLocalizedText("InkPlayground-ColorPalette-Event-Ready"));
	}
}
