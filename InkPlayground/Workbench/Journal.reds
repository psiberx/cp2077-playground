module InkPlayground.Workbench
import Codeware.UI.*

public class Journal extends inkCustomController {
	protected let m_root: wref<inkFlex>;

	protected let m_log: wref<inkVerticalPanel>;

	protected cb func OnCreate() -> Void {
		let root: ref<inkFlex> = new inkFlex();
		root.SetName(n"journal");
		root.SetAnchor(inkEAnchor.LeftFillVerticaly);
		root.SetMargin(new inkMargin(16.0, 12.0, 0.0, 12.0));
		root.SetChildOrder(inkEChildOrder.Backward);

		let log: ref<inkVerticalPanel> = new inkVerticalPanel();
		log.SetName(n"log");
		log.SetAnchor(inkEAnchor.Fill);
		log.SetChildOrder(inkEChildOrder.Backward);
		log.SetOpacity(0.6);
		log.Reparent(root);

		this.m_root = root;
		this.m_log = log;

		this.SetRootWidget(root);
	}

	public func AddEntry(text: String) -> Void {
		let entry: ref<inkText> = new inkText();
		entry.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
		entry.SetFontStyle(n"Regular");
		entry.SetFontSize(24);
		entry.SetTintColor(ThemeColors.Bittersweet());
		entry.SetText(text);
		entry.Reparent(this.m_log);

		this.FadeInEntry(entry);
		this.TrimEntries();

		LogChannel(n"DEBUG", "[InkPlayground] " + text);
	}

	protected func GetMaxEntries() -> Int32 = 7

	protected func TrimEntries() -> Void {
		if this.m_log.GetNumChildren() > this.GetMaxEntries() {
			this.FadeOutEntry(this.m_log.GetWidgetByIndex(this.m_log.GetNumChildren() - this.GetMaxEntries() - 1));
		}
	}

	protected func FadeInEntry(entry: ref<inkWidget>) -> Void {
		let marginAnim: ref<inkAnimMargin> = new inkAnimMargin();
		marginAnim.SetStartMargin(new inkMargin(40.0, 0.0, 0.0, 0.0));
		marginAnim.SetEndMargin(new inkMargin(0.0, 0.0, 0.0, 0.0));
		marginAnim.SetMode(inkanimInterpolationMode.EasyOut);
		marginAnim.SetDuration(0.25);

		let alphaAnim: ref<inkAnimTransparency> = new inkAnimTransparency();
		alphaAnim.SetStartTransparency(0.0);
		alphaAnim.SetEndTransparency(1.0);
		alphaAnim.SetMode(inkanimInterpolationMode.EasyIn);
		alphaAnim.SetDuration(0.5);

		let animDef: ref<inkAnimDef> = new inkAnimDef();
		animDef.AddInterpolator(marginAnim);
		animDef.AddInterpolator(alphaAnim);

		entry.PlayAnimation(animDef);
	}

	protected func FadeOutEntry(entry: ref<inkWidget>) -> Void {
		let alphaAnim: ref<inkAnimTransparency> = new inkAnimTransparency();
		alphaAnim.SetStartTransparency(1.0);
		alphaAnim.SetEndTransparency(0.0);
		alphaAnim.SetMode(inkanimInterpolationMode.EasyOut);
		alphaAnim.SetDuration(0.25);

		let animDef: ref<inkAnimDef> = new inkAnimDef();
		animDef.AddInterpolator(alphaAnim);

		let animProxy: ref<inkAnimProxy> = entry.PlayAnimation(animDef);
		animProxy.RegisterToCallback(inkanimEventType.OnFinish, this, n"OnFadeOutEnd");
	}

	protected cb func OnFadeOutEnd(animProxy: ref<inkAnimProxy>) -> Bool {
		this.m_log.RemoveChildByIndex(0);
	}

	public static func Create() -> ref<Journal> {
		let self: ref<Journal> = new Journal();
		self.CreateInstance();

		return self;
	}
}
