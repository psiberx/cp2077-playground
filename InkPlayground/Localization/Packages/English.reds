module InkPlayground.Localization.Packages
import Codeware.Localization.*

public class English extends ModLocalizationPackage {
	protected func DefineTexts() {
		this.Text("InkPlayground-Action-Label", "Ink Playground");

		this.Text("InkPlayground-Popup-Title", "Ink Playground");
		this.Text("InkPlayground-Popup-Fluff-Right", "Build & Play With Ink Widgets");
		this.Text("InkPlayground-Popup-Fluff-Bottom",
			"This entire widget is 100% built from scratch using redscript.\n" +
			"There are no reused, wrapped or extended widgets.\n" +
			"Powered by Base Lib prototype.");

		this.Text("InkPlayground-ButtonBasics-Event-Ready", "All buttons are ready");
		this.Text("InkPlayground-ButtonBasics-Event-Click", "Click");
		this.Text("InkPlayground-ButtonBasics-Event-Enable", "Enable");
		this.Text("InkPlayground-ButtonBasics-Event-Disable", "Disable");
		this.Text("InkPlayground-ButtonBasics-Button-Left", "Button L");
		this.Text("InkPlayground-ButtonBasics-Button-Right", "Button R");
		this.Text("InkPlayground-ButtonBasics-Button-Hub", "Hub Button");
		this.Text("InkPlayground-ButtonBasics-Action-Interact", "Interact");
		this.Text("InkPlayground-ButtonBasics-Action-Enable", "Enable");
		this.Text("InkPlayground-ButtonBasics-Action-Disable", "Disable");

		this.Text("InkPlayground-ColorPalette-Event-Ready", "Palette created");

		this.Text("InkPlayground-CursorState-Event-Ready", "Cursor tracking started");

		this.Text("InkPlayground-DragImage-Event-Ready", "Image is ready");
		this.Text("InkPlayground-DragImage-Action-Drag", "Drag");

		this.Text("InkPlayground-InputText-Event-Ready", "Text input is ready");
		this.Text("InkPlayground-InputText-Input-Label", "Text input");
	}
}
