// -----------------------------------------------------------------------------
// inkVirtualResolutionListener
// -----------------------------------------------------------------------------
//
// - Watch for screen resolution changes
// - Scale and resize widgets
// - Notify controllers
//

public class inkVirtualResolutionListener extends ConfigVarListener {
	protected let m_initialized: Bool;

	protected let m_window: Vector2;

	protected let m_game: GameInstance;

	protected let m_targets: array<ref<inkVirtualResolutionTarget>>;

	protected let m_gameControllers: array<wref<inkGameController>>;

	protected let m_logicControllers: array<wref<inkLogicController>>;

	public func Initialize(game: GameInstance) -> Void {
		if !this.m_initialized {
			this.m_game = game;

			if this.m_window.X == 0.0 {
				this.m_window = new Vector2(3840.0, 2160.0);
			}

			this.Register(n"/video/display");

			this.ApplyScalingToAllTargets();
			this.SendEventToAllControllers();

			this.m_initialized = true;
		}
	}

	public func SetWindowSize(size: Vector2) -> Void {
		this.m_window = size;

		if this.m_initialized {
			this.ApplyScalingToAllTargets();
			this.SendEventToAllControllers();
		}
	}

	public func SetWindowSize(width: Float, height: Float) -> Void {
		this.SetWindowSize(new Vector2(width, height));
	}

	public func ScaleWidget(widget: ref<inkWidget>) -> Void {
		let target = inkVirtualResolutionScaleTarget.Create(widget);

		ArrayPush(this.m_targets, target);

		if this.m_initialized {
			this.ApplyScalingToTarget(target);
		}
	}

	public func ResizeWidget(widget: ref<inkWidget>) -> Void {
		let target = inkVirtualResolutionResizeTarget.Create(widget);

		ArrayPush(this.m_targets, target);

		if this.m_initialized {
			this.ApplyScalingToTarget(target);
		}
	}

	public func NotifyController(target: ref<inkGameController>) -> Void {
		ArrayPush(this.m_gameControllers, target);

		if this.m_initialized {
			this.SendEventToController(target);
		}
	}

	public func NotifyController(target: ref<inkLogicController>) -> Void {
		ArrayPush(this.m_logicControllers, target);

		if this.m_initialized {
			this.SendEventToController(target);
		}
	}

	protected func GetCurrentState() -> ref<inkResolutionData> {
		let settings: ref<UserSettings> = GameInstance.GetSettingsSystem(this.m_game);
		let configVar: ref<ConfigVarListString> = settings.GetVar(n"/video/display", n"Resolution") as ConfigVarListString;
		let resolution: String = configVar.GetValue();
		let dimensions: array<String> = StrSplit(resolution, "x");
		let size: Vector2 = new Vector2(StringToFloat(dimensions[0]), StringToFloat(dimensions[1]));
		let scale: Vector2 = new Vector2(size.X / this.m_window.X, size.Y / this.m_window.Y);

		return inkResolutionData.Create(resolution, size, scale);
	}

	protected cb func OnVarModified(groupPath: CName, varName: CName, varType: ConfigVarType, reason: ConfigChangeReason) -> Void {
		if Equals(groupPath, n"/video/display") && Equals(varName, n"Resolution") && Equals(reason, ConfigChangeReason.Accepted) {
			this.ApplyScalingToAllTargets();
			this.SendEventToAllControllers();
		}
	}

	protected func ApplyScalingToAllTargets() -> Void {
		let state: ref<inkResolutionData> = this.GetCurrentState();

		for target in this.m_targets {
			target.ApplyState(state);
		}
	}

	protected func ApplyScalingToTarget(target: ref<inkVirtualResolutionTarget>) -> Void {
		target.ApplyState(this.GetCurrentState());
	}

	protected func SendEventToAllControllers() -> Void {
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

public abstract class inkVirtualResolutionTarget {
	protected let m_widget: wref<inkWidget>;

	public func ApplyState(state: ref<inkResolutionData>) -> Void
}

public class inkVirtualResolutionScaleTarget extends inkVirtualResolutionTarget {
	public func ApplyState(state: ref<inkResolutionData>) -> Void
	{
		this.m_widget.SetScale(state.GetSmartScale());
	}

	public static func Create(widget: wref<inkWidget>) -> ref<inkVirtualResolutionScaleTarget> {
		let target = new inkVirtualResolutionScaleTarget();
		target.m_widget = widget;

		return target;
	}
}

public class inkVirtualResolutionResizeTarget extends inkVirtualResolutionTarget {
	protected let m_size: Vector2;

	public func ApplyState(state: ref<inkResolutionData>) -> Void
	{
		let scale: Vector2 = state.GetSmartScale();

		this.m_widget.SetSize(new Vector2(this.m_size.X * scale.X, this.m_size.Y * scale.Y));
	}

	public static func Create(widget: wref<inkWidget>) -> ref<inkVirtualResolutionResizeTarget> {
		let target = new inkVirtualResolutionResizeTarget();
		target.m_widget = widget;
		target.m_size = widget.GetSize();

		return target;
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
		let data = new inkResolutionData();
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
		let event = new inkResolutionChangeEvent();
		event.m_state = state;

		return event;
	}
}
