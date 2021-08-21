// -----------------------------------------------------------------------------
// inkVirtualResolutionListener
// -----------------------------------------------------------------------------
//
// - Watch for screen resolution change
// - Apply scaling to widgets
// - Notify controllers
//

public class inkVirtualResolutionListener extends ConfigVarListener {
	private let m_initialized: Bool;

	private let m_game: GameInstance;

	private let m_widgets: array<wref<inkWidget>>;

	private let m_controllers: array<wref<inkLogicController>>;

	public func Initialize(game: GameInstance) -> Void {
		if !this.m_initialized {
			this.m_game = game;

			this.Register(n"/video/display");
			this.ApplyScalingToWidgets();
			this.SendEventToControllers();

			this.m_initialized = true;
		}
	}

	public func AddTarget(target: ref<inkWidget>) -> Void {
		ArrayPush(this.m_widgets, target);

		if this.m_initialized {
			this.ApplyScalingToWidget(target);
		}
	}

	public func AddTarget(target: ref<inkLogicController>) -> Void {
		ArrayPush(this.m_controllers, target);

		if this.m_initialized {
			this.SendEventToController(target);
		}
	}

	public cb func OnVarModified(groupPath: CName, varName: CName, varType: ConfigVarType, reason: ConfigChangeReason) -> Void {
		if Equals(groupPath, n"/video/display") && Equals(varName, n"Resolution") && Equals(reason, ConfigChangeReason.Accepted) {
			this.ApplyScalingToWidgets();
			this.SendEventToControllers();
		}
	}

	private func ApplyScalingToWidgets() -> Void {
		let state: ref<inkResolutionData> = this.GetCurrentState();

		for target in this.m_widgets {
			this.SetScaling(target, state.ratio);
		}
	}

	private func ApplyScalingToWidget(target: wref<inkWidget>) -> Void {
		this.SetScaling(target, this.GetCurrentState().ratio);
	}

	private func SetScaling(target: wref<inkWidget>, ratio: Float) -> Void {
		target.SetScale(new Vector2(ratio, ratio));
	}

	private func SendEventToControllers() -> Void {
		let state: ref<inkResolutionData> = this.GetCurrentState();

		for target in this.m_controllers {
			this.SendEvent(target, state);
		}
	}

	private func SendEventToController(target: wref<inkLogicController>) -> Void {
		this.SendEvent(target, this.GetCurrentState());
	}

	private func SendEvent(target: wref<inkLogicController>, data: ref<inkResolutionData>) -> Void {
		target.QueueEvent(inkResolutionChangeEvent.Create(data));
	}

	private func GetCurrentState() -> ref<inkResolutionData> {
		let settings: ref<UserSettings> = GameInstance.GetSettingsSystem(this.m_game);
		let configVar: ref<ConfigVarListString> = settings.GetVar(n"/video/display", n"Resolution") as ConfigVarListString;
		let resolution: String = configVar.GetValue();
		let dimensions: array<String> = StrSplit(resolution, "x");
		let ratio: Float = StringToFloat(dimensions[0]) / 3840.0;

		return inkResolutionData.Create(resolution, ratio);
	}
}

public class inkResolutionData {
	public let resolution: String;

	public let ratio: Float;

	public static func Create(resolution: String, ratio: Float) -> ref<inkResolutionData> {
		let data: ref<inkResolutionData> = new inkResolutionData();
		data.resolution = resolution;
		data.ratio = ratio;

		return data;
	}
}

public class inkResolutionChangeEvent extends inkEvent {
	protected let m_data: ref<inkResolutionData>;

	public func GetResolution() -> String {
		return this.m_data.resolution;
	}

	public func GetRatio() -> Float {
		return this.m_data.ratio;
	}

	public static func Create(data: ref<inkResolutionData>) -> ref<inkResolutionChangeEvent> {
		let event: ref<inkResolutionChangeEvent> = new inkResolutionChangeEvent();
		event.m_data = data;

		return event;
	}
}
