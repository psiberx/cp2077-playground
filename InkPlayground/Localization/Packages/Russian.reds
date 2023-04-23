module InkPlayground.Localization.Packages
import Codeware.Localization.*

public class Russian extends ModLocalizationPackage {
	public func DefineTexts() {
		this.Text("InkPlayground-Action-Label", "Ink Playground");

		this.Text("InkPlayground-Popup-Title", "Ink Playground");
		this.Text("InkPlayground-Popup-Fluff-Right", "Создавайте и эксперементируйте с виджетами");
		this.Text("InkPlayground-Popup-Fluff-Bottom",
			"Этот виджет целиком создан с использованием redscript.\n" +
			"Он не переопределяет и не дополняет уже существующие виджеты.\n" +
			"Сделано с помощью библиотеки Base Lib.");

		this.Text("InkPlayground-ButtonBasics-Event-Ready", "Кнопки готовы");
		this.Text("InkPlayground-ButtonBasics-Event-Click", "Нажата");
		this.Text("InkPlayground-ButtonBasics-Event-Enable", "Включена");
		this.Text("InkPlayground-ButtonBasics-Event-Disable", "Выключена");
		this.Text("InkPlayground-ButtonBasics-Button-Left", "Кнопка Л");
		this.Text("InkPlayground-ButtonBasics-Button-Right", "Кнопка П");
		this.Text("InkPlayground-ButtonBasics-Button-Hub", "Хаб Кнопка");
		this.Text("InkPlayground-ButtonBasics-Action-Interact", "Нажать");
		this.Text("InkPlayground-ButtonBasics-Action-Enable", "Включить");
		this.Text("InkPlayground-ButtonBasics-Action-Disable", "Выключить");

		this.Text("InkPlayground-ColorPalette-Event-Ready", "Палитра создана");

		this.Text("InkPlayground-CursorState-Event-Ready", "Начато отслеживание курсора");

		this.Text("InkPlayground-DragImage-Event-Ready", "Изображение готово");
		this.Text("InkPlayground-DragImage-Action-Drag", "Перемещать");

		this.Text("InkPlayground-InputText-Event-Ready", "Текстовое поле готово");
		this.Text("InkPlayground-InputText-Input-Label", "Ввод текста");
	}
}
