// -----------------------------------------------------------------------------
// inkText Imports
// -----------------------------------------------------------------------------
//
// - Content alignment options
// - Justification options
//
// -----------------------------------------------------------------------------
//
// class inkText extends inkLeafWidget {
//   public func GetContentHAlign() -> inkEHorizontalAlign
//   public func SetContentHAlign(contentHAlign: inkEHorizontalAlign) -> Void
//   public func GetContentVAlign() -> inkEVerticalAlign
//   public func SetContentVAlign(contentVAlign: inkEVerticalAlign) -> Void
//   public func GetJustificationType() -> textJustificationType
//   public func SetJustificationType(justification: textJustificationType) -> Void
// }
//

enum textJustificationType
{
	Left = 0,
	Center = 1,
	Right = 2
}

@addField(inkText)
native let contentHAlign: inkEHorizontalAlign;

@addField(inkText)
native let contentVAlign: inkEVerticalAlign;

@addField(inkText)
native let justification: textJustificationType;

@addMethod(inkText)
public func GetContentHAlign() -> inkEHorizontalAlign {
	return this.contentHAlign;
}

@addMethod(inkText)
public func SetContentHAlign(contentHAlign: inkEHorizontalAlign) -> Void {
	this.contentHAlign = contentHAlign;
}

@addMethod(inkText)
public func GetContentVAlign() -> inkEVerticalAlign {
	return this.contentVAlign;
}

@addMethod(inkText)
public func SetContentVAlign(contentVAlign: inkEVerticalAlign) -> Void {
	this.contentVAlign = contentVAlign;
}

@addMethod(inkText)
public func GetJustificationType() -> textJustificationType {
	return this.justification;
}

@addMethod(inkText)
public func SetJustificationType(justification: textJustificationType) -> Void {
	this.justification = justification;
}

//var lockFontInGame : Bool; // 0x2bc
//var lineHeightPercentage : Float; // 0x308
//var wrappingInfo : textWrappingInfo; // 0x328
//var justification : textJustificationType; // 0x334
//var textOverflowPolicy : textOverflowPolicy; // 0x338

//struct textWrappingInfo
//{
//	var autoWrappingEnabled : Bool; // 0
//	var wrappingAtPosition : Float; // 0x4
//	var wrappingPolicy : textWrappingPolicy; // 0x8
//}

//enum textWrappingPolicy
//{
//	Default = 0,
//	PerCharacter = 1
//}

//enum textOverflowPolicy
//{
//	None = 0,
//	DotsEnd = 1,
//	DotsEndLastLine = 2,
//	AutoScroll = 3,
//	PingPongScroll = 4,
//	AdjustToSize = 5
//}
