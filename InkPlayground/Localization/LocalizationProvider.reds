module InkPlayground.Localization
import InkPlayground.Localization.Packages.*
import BaseLib.Localization.*

public class LocalizationProvider extends ModLocalizationProvider {
	public func GetPackage(language: CName) -> ref<ModLocalizationPackage> {
		switch language {
			case n"ru-ru": return new Russian();
			default: return new English();
		}
	}
}
