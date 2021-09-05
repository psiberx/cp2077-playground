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
				this.m_original = new Vector2(3860.0, 2160.0);
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
		let ratio: Vector2 = new Vector2(size.X / this.m_original.X, size.Y / this.m_original.Y);

		return inkResolutionData.Create(resolution, size, ratio);
	}

	protected func ApplyScalingToWidgets() -> Void {
		let state: ref<inkResolutionData> = this.GetCurrentState();

		for target in this.m_widgets {
			this.SetScaling(target, state.GetScaling());
		}
	}

	protected func ApplyScalingToWidget(target: wref<inkWidget>) -> Void {
		this.SetScaling(target, this.GetCurrentState().GetScaling());
	}

	protected func SetScaling(target: wref<inkWidget>, ratio: Float) -> Void {
		target.SetScale(new Vector2(ratio, ratio));
	}

	protected func SendEventToControllers() -> Void {
		let state: ref<inkResolutionData> = this.GetCurrentState();

		for target in this.m_gameControllers {
			this.SendEvent(target, state);
		}

		for target in this.m_logicControllers {
			this.SendEvent(target, state);
		}
	}

	protected func SendEventToController(target: wref<inkGameController>) -> Void {
		this.SendEvent(target, this.GetCurrentState());
	}

	protected func SendEventToController(target: wref<inkLogicController>) -> Void {
		this.SendEvent(target, this.GetCurrentState());
	}

	protected func SendEvent(target: wref<inkGameController>, data: ref<inkResolutionData>) -> Void {
		target.QueueEvent(inkResolutionChangeEvent.Create(data));
	}

	protected func SendEvent(target: wref<inkLogicController>, data: ref<inkResolutionData>) -> Void {
		target.QueueEvent(inkResolutionChangeEvent.Create(data));
	}
}

public class inkResolutionData {
	protected let m_resolution: String;

	protected let m_size: Vector2;

	protected let m_ratio: Vector2;

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

	public func GetRatio() -> Vector2 {
		return this.m_ratio;
	}

	public func GetHorizontalRatio() -> Float {
		return this.m_ratio.X;
	}

	public func GetVerticalRatio() -> Float {
		return this.m_ratio.Y;
	}

	public func GetScaling() -> Float {
		return this.m_ratio.X < this.m_ratio.Y ? this.m_ratio.X : this.m_ratio.Y;
	}

	public static func Create(resolution: String, size: Vector2, ratio: Vector2) -> ref<inkResolutionData> {
		let data: ref<inkResolutionData> = new inkResolutionData();
		data.m_resolution = resolution;
		data.m_size = size;
		data.m_ratio = ratio;

		return data;
	}
}

public class inkResolutionChangeEvent extends inkEvent {
	protected let m_data: ref<inkResolutionData>;

	public func GetData() -> wref<inkResolutionData> {
		return this.m_data;
	}

	public static func Create(data: ref<inkResolutionData>) -> ref<inkResolutionChangeEvent> {
		let event: ref<inkResolutionChangeEvent> = new inkResolutionChangeEvent();
		event.m_data = data;

		return event;
	}
}
