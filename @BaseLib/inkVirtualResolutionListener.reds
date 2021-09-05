// -----------------------------------------------------------------------------
// inkVirtualResolutionListener
// -----------------------------------------------------------------------------
//
// - Watch for screen resolution changes
// - Apply scaling to widgets
// - Notify controllers
//

public class inkVirtualResolutionListener extends ConfigVarListener {
	protected let m_initialized: Bool;

	protected let m_original: Vector2;

	protected let m_game: GameInstance;

	protected let m_widgets: array<wref<inkWidget>>;

	protected let m_gameControllers: array<wref<inkGameController>>;

	protected let m_logicControllers: array<wref<inkLogicController>>;

	public func Initialize(game: GameInstance) -> Void {
		if !this.m_initialized {
			this.m_game = game;

			if this.m_original.X == 0.0 {
				this.m_original = new Vector2(3840.0, 2160.0);
			}

			this.Register(n"/video/display");

			this.ApplyScalingToWidgets();
			this.SendEventToControllers();

			this.m_initialized = true;
		}
	}

	public func SetOriginalSize(size: Vector2) -> Void {
		this.m_original = size;

		if this.m_initialized {
			this.ApplyScalingToWidgets();
			this.SendEventToControllers();
		}
	}

	public func SetOriginalSize(width: Float, height: Float) -> Void {
		this.SetOriginalSize(new Vector2(width, height));
	}

	public func AddTarget(target: ref<inkWidget>) -> Void {
		ArrayPush(this.m_widgets, target);

		if this.m_initialized {
			this.ApplyScalingToWidget(target);
		}
	}

	public func AddTarget(target: ref<inkGameController>) -> Void {
		ArrayPush(this.m_gameControllers, target);

		if this.m_initialized {
			this.SendEventToController(target);
		}
	}

	public func AddTarget(target: ref<inkLogicController>) -> Void {
		ArrayPush(this.m_logicControllers, target);

		if this.m_initialized {
			this.SendEventToController(target);
		}
	}

	protected cb func OnVarModified(groupPath: CName, varName: CName, varType: ConfigVarType, reason: ConfigChangeReason) -> Void {
		if Equals(groupPath, n"/video/display") && Equals(varName, n"Resolution") && Equals(reason, ConfigChangeReason.Accepted) {
			this.ApplyScalingToWidgets();
			this.SendEventToControllers();
		}
	}

	protected func GetCurrentState() -> ref<inkResolutionData> {
		let settings: ref<UserSettings> = GameInstance.GetSettingsSystem(this.m_game);
		let configVar: ref<ConfigVarListString> = settings.GetVar(n"/video/display", n"Resolution") as ConfigVarListString;
		let resolution: String = configVar.GetValue();
		let dimensions: array<String> = StrSplit(resolution, "x");
		let size: Vector2 = new Vector2(StringToFloat(dimensions[0]), StringToFloat(dimensions[1]));
		let scale: Vector2 = new Vector2(size.X / this.m_original.X, size.Y / this.m_original.Y);

		return inkResolutionData.Create(resolution, size, scale);
	}

	protected func ApplyScalingToWidgets() -> Void {
		let scale: Vector2 = this.GetCurrentState().GetSmartScale();

		for target in this.m_widgets {
			target.SetScale(scale);
		}
	}

	protected func ApplyScalingToWidget(target: wref<inkWidget>) -> Void {
		target.SetScale(this.GetCurrentState().GetSmartScale());
	}

	protected func SendEventToControllers() -> Void {
		let state: ref<inkResolutionData> = this.GetCurrentState();
		let event: ref<inkResolutionChangeEvent> = inkResolutionChangeEvent.Create(state);

		for target in this.m_gameControllers {
			target.QueueEvent(event);
		}

		for target in this.m_logicControllers {
			target.QueueEvent(event);
		}
	}

	protected func SendEventToController(target: wref<inkGameController>) -> Void {
		target.QueueEvent(inkResolutionChangeEvent.Create(this.GetCurrentState()));
	}

	protected func SendEventToController(target: wref<inkLogicController>) -> Void {
		target.QueueEvent(inkResolutionChangeEvent.Create(this.GetCurrentState()));
	}
}

public class inkResolutionData {
	protected let m_resolution: String;

	protected let m_size: Vector2;

	protected let m_scale: Vector2;

	public func GetResolution() -> String {
		return this.m_resolution;
	}

	public func GetSize() -> Vector2 {
		return this.m_size;
	}

	public func GetWidth() -> Float {
		return this.m_size.X;
	}

	public func GetHeight() -> Float {
		return this.m_size.Y;
	}

	public func GetAspectRatio() -> Float {
		return this.m_size.X / this.m_size.Y;
	}

	public func GetScale() -> Vector2 {
		return this.m_scale;
	}

	public func GetScaleX() -> Float {
		return this.m_scale.X;
	}

	public func GetScaleY() -> Float {
		return this.m_scale.Y;
	}

	public func GetSmartScaleFactor() -> Float {
		return this.m_scale.X < this.m_scale.Y ? this.m_scale.X : this.m_scale.Y;
	}

	public func GetSmartScale() -> Vector2 {
		let factor: Float = this.GetSmartScaleFactor();

		return new Vector2(factor, factor);
	}

	public static func Create(resolution: String, size: Vector2, scale: Vector2) -> ref<inkResolutionData> {
		let data: ref<inkResolutionData> = new inkResolutionData();
		data.m_resolution = resolution;
		data.m_size = size;
		data.m_scale = scale;

		return data;
	}
}

public class inkResolutionChangeEvent extends inkEvent {
	protected let m_state: ref<inkResolutionData>;

	public func GetState() -> wref<inkResolutionData> {
		return this.m_state;
	}

	public static func Create(state: ref<inkResolutionData>) -> ref<inkResolutionChangeEvent> {
		let event: ref<inkResolutionChangeEvent> = new inkResolutionChangeEvent();
		event.m_state = state;

		return event;
	}
}
