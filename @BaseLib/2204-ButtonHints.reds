// -----------------------------------------------------------------------------
// ButtonHints Extensions
// -----------------------------------------------------------------------------
//
// - Update hint visibility without removing it
// - Alternative styles (popup)
//

@addField(ButtonHints)
let m_overrideStyle: CName;

@addMethod(ButtonHints)
public func OverrideStyle(styleName: CName) -> Void {
	this.m_overrideStyle = styleName;
}

@wrapMethod(ButtonHints)
public final func AddButtonHint(action: CName, label: String) -> Void {
	wrappedMethod(action, label);

	if NotEquals(this.m_overrideStyle, n"") {
		let item: wref<ButtonHintListItem> = this.CheckForPreExisting(action);
		item.OverrideStyle(this.m_overrideStyle);
	};
}

@addMethod(ButtonHintListItem)
public func OverrideStyle(styleName: CName) -> Void {
	if Equals(styleName, n"popup") {
		inkTextRef.SetFontStyle(this.m_label, n"Semi-Bold");
		inkTextRef.SetFontSize(this.m_label, 38);
		inkTextRef.SetLetterCase(this.m_label, textLetterCase.UpperCase);
	};
}
