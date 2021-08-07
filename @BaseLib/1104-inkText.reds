// -----------------------------------------------------------------------------
// inkText Imports
// -----------------------------------------------------------------------------
//
// - Alignment options for content
//
// -----------------------------------------------------------------------------
//
// class inkText extends inkLeafWidget {
//   public func GetContentHAlign() -> inkEHorizontalAlign
//   public func SetContentHAlign(contentHAlign: inkEHorizontalAlign) -> Void
//   public func GetContentVAlign() -> inkEVerticalAlign
//   public func SetContentVAlign(contentVAlign: inkEVerticalAlign) -> Void
// }
//

@addField(inkText)
native let contentHAlign: inkEHorizontalAlign;

@addField(inkText)
native let contentVAlign: inkEVerticalAlign;

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

//enum textJustificationType
//{
//	Left = 0,
//	Center = 1,
//	Right = 2
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
