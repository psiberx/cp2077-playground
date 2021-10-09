// -----------------------------------------------------------------------------
// ButtonHints Extensions
// -----------------------------------------------------------------------------
//
// - Alternative styles (popup)
// - Lock state to temporarily prevent updates
// - [TODO] Update hint visibility without removing it
//

module BaseLib

@addField(ButtonHints)
let m_overrideStyle: CName;

@addMethod(ButtonHints)
public func OverrideStyle(styleName: CName) -> Void {
	this.m_overrideStyle = styleName;

	if Equals(styleName, n"popup") {
		let holder: ref<inkCompoundWidget> = inkCompoundRef.Get(this.m_horizontalHolder) as inkCompoundWidget;
		holder.SetChildMargin(new inkMargin(30.0, 0.0, 0.0, 0.0));
	}
}

@addField(ButtonHints)
let m_isLocked: Bool;

@addMethod(ButtonHints)
public func Lock() -> Void {
	this.m_isLocked = true;
}

@addMethod(ButtonHints)
public func Unlock() -> Void {
	this.m_isLocked = false;
}

@wrapMethod(ButtonHints)
public final func AddButtonHint(action: CName, label: String) -> Void {
	if !this.m_isLocked {
		wrappedMethod(action, label);

		if NotEquals(this.m_overrideStyle, n"") {
			let item: wref<ButtonHintListItem> = this.CheckForPreExisting(action);
			item.OverrideStyle(this.m_overrideStyle);
		}
	}
}

@wrapMethod(ButtonHints)
public final func AddCharacterRoatateButtonHint() -> Void {
	if !this.m_isLocked {
		wrappedMethod();
	}
}

@wrapMethod(ButtonHints)
public final func RemoveButtonHint(action: CName) -> Void {
	if !this.m_isLocked {
		wrappedMethod(action);
	}
}

@wrapMethod(ButtonHints)
public final func ClearButtonHints() -> Void {
	if !this.m_isLocked {
		wrappedMethod();
	}
}

@addMethod(ButtonHintListItem)
public func OverrideStyle(styleName: CName) -> Void {
	if Equals(styleName, n"popup") {
		inkTextRef.SetFontStyle(this.m_label, n"Semi-Bold");
		inkTextRef.SetFontSize(this.m_label, 38);
		inkTextRef.SetLetterCase(this.m_label, textLetterCase.UpperCase);
	}
}
