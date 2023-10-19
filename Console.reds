public static func LogDamage(const str: script_ref<String>) -> Void {
  LogChannel(n"Damage", str);
}

public static func LogDM(const str: script_ref<String>) -> Void {
  LogChannel(n"DevelopmentManager", str);
}

public static func LogItems(const str: script_ref<String>) -> Void {
  LogChannel(n"Items", str);
}

public static func LogStats(const str: script_ref<String>) -> Void {
  LogChannel(n"Stats", str);
}

public static func LogStatPools(const str: script_ref<String>) -> Void {
  LogChannel(n"StatPools", str);
}

public static func LogStrike(const str: script_ref<String>) -> Void {
  LogChannel(n"Strike", str);
}

public static func LogAI(const str: script_ref<String>) -> Void {
  LogChannel(n"AI", str);
}

public static func LogAIError(const str: script_ref<String>) -> Void {
  LogChannelError(n"AI", str);
  ReportFailure(str);
}

public static func LogAICoverError(const str: script_ref<String>) -> Void {
  LogChannelWarning(n"AICover", str);
}

public static func LogPuppet(const str: script_ref<String>) -> Void {
  LogChannel(n"Puppet", str);
}

public static func LogUI(const str: script_ref<String>) -> Void {
  LogChannel(n"UI", str);
}

public static func LogUIWarning(const str: script_ref<String>) -> Void {
  LogChannelWarning(n"UI", str);
}

public static func LogUIError(const str: script_ref<String>) -> Void {
  LogChannelError(n"UI", str);
}

public static func LogTargetManager(const str: script_ref<String>, opt type: CName) -> Void {
  FindProperLog(n"TargetManager", type, str);
}

public static func LogDevices(const str: script_ref<String>, opt type: ELogType) -> Void {
  if IsFinal() {
    return;
  };
  FindProperLog(n"Device", type, str);
}

public static func LogDevices(const object: ref<IScriptable>, const str: script_ref<String>, opt type: ELogType) -> Void {
  let address: String;
  let deviceObj: ref<Device>;
  let devicePS: ref<ScriptableDeviceComponentPS>;
  let deviceSpecificTags: String;
  let extendedString: String;
  let id: String;
  let isOverride: Int32;
  let puppetPS: ref<ScriptedPuppetPS>;
  let tooltip: String;
  return;
}

public static func LogDevices(const object: ref<SecuritySystemControllerPS>, input: ref<SecuritySystemInput>, const str: script_ref<String>, opt type: ELogType) -> Void {
  let message: String;
  let prefix: String;
  if IsFinal() {
    return;
  };
  prefix = "SecuritySystemInput [ Frame: " + IntToString(Cast<Int32>(GameInstance.GetFrameNumber(object.GetGameInstance()))) + " @" + " | ID #" + input.GetID() + " ]";
  message = prefix + " " + str;
  LogDevices(object, message, type);
}

public static func LogDevices(const object: ref<SecuritySystemControllerPS>, id: Int32, const str: script_ref<String>, opt type: ELogType) -> Void {
  let message: String;
  let prefix: String;
  if IsFinal() {
    return;
  };
  prefix = "Most recent accepted ID [ Frame: " + IntToString(Cast<Int32>(GameInstance.GetFrameNumber(object.GetGameInstance()))) + " @" + id + " ]";
  message = prefix + " " + str;
  LogDevices(object, message, type);
}

public static func LogDevices(const object: ref<SecurityAreaControllerPS>, id: Int32, const str: script_ref<String>, opt type: ELogType) -> Void {
  let message: String;
  let prefix: String;
  if IsFinal() {
    return;
  };
  prefix = "[ Frame: " + IntToString(Cast<Int32>(GameInstance.GetFrameNumber(object.GetGameInstance()))) + " #" + id + " ]";
  message = prefix + " " + str;
  LogDevices(object, message, type);
}

public static func FindProperLog(channelName: CName, logType: ELogType, const message: script_ref<String>) -> Void {
  switch logType {
    case ELogType.WARNING:
      LogChannelWarning(channelName, message);
      break;
    case ELogType.ERROR:
      LogChannelError(channelName, message);
      break;
    default:
      LogChannel(channelName, message);
  };
}

public static func FindProperLog(channelName: CName, logType: CName, const message: script_ref<String>) -> Void {
  if Equals(logType, n"Warning") || Equals(logType, n"warning") || Equals(logType, n"w") {
    LogChannelWarning(channelName, message);
  } else {
    if Equals(logType, n"Error") || Equals(logType, n"error") || Equals(logType, n"e") {
      LogChannelError(channelName, message);
    } else {
      LogChannel(channelName, message);
    };
  };
}

public static func LogAssert(condition: Bool, const text: script_ref<String>) -> Void {
  if !condition {
    LogChannel(n"ASSERT", text);
  };
}

public static exec func CastEnum() -> Void {
  let enumState: EDeviceStatus = EDeviceStatus.DISABLED;
  let value: Int32 = EnumInt(enumState);
  switch value {
    case -2:
      Log("Disabled " + IntToString(value));
      break;
    case -1:
      Log("Unpowered " + IntToString(value));
      break;
    case 0:
      Log("Off " + IntToString(value));
      break;
    case 1:
      Log("On " + IntToString(value));
      break;
    default:
      Log("wtf " + IntToString(value));
  };
}

public static exec func GetFunFact() -> Void {
  let RNG: Int32 = RandRange(0, 23);
  switch RNG {
    case 0:
      Log("Duck vaginas are spiral shaped with dead ends.");
      break;
    case 1:
      Log("Plural of axolotl is axolotls");
      break;
    case 2:
      Log("In the UK, it is illegal to eat mince pies on Christmas Day!");
      break;
    case 3:
      Log("Pteronophobia is the fear of being tickled by feathers!");
      break;
    case 4:
      Log("When hippos are upset, their sweat turns red.");
      break;
    case 5:
      Log("The average woman uses her height in lipstick every 5 years.");
      break;
    case 6:
      Log(" Cherophobia is the fear of fun");
      break;
    case 7:
      Log("If Pinokio says \u{201c}My Nose Will Grow Now\u{201d}, it would cause a paradox. ");
      break;
    case 8:
      Log("Billy goats urinate on their own heads to smell more attractive to females.");
      break;
    case 9:
      Log("The person who invented the Frisbee was cremated and made into a frisbee after he died!");
      break;
    case 10:
      Log("If you consistently fart for 6 years & 9 months, enough gas is produced to create the energy of an atomic bomb!");
      break;
    case 11:
      Log("McDonalds calls frequent buyers of their food \u{201c}heavy users.");
      break;
    case 12:
      Log("Guinness Book of Records holds the record for being the book most often stolen from Public Libraries.");
      break;
    case 13:
      Log("In Romania it is illegal to performe pantimime as it is considered to be higly offensive");
    case 14:
      Log("Banging your head against a wall can burn 150 calories per hour");
    case 15:
      Log("Crocodile poop used to be used as a contraception");
      break;
    case 16:
      Log("In Finland they have an official tournament for peaple riding on a fake horses");
      break;
    case 17:
      Log("The Vatican City is the country that drinks the most wine per capita at 74 liters per citizen per year.");
      break;
    case 18:
      Log("It\'s possible to lead a cow upstairs...but not downstairs.");
      break;
    case 19:
      Log("There\'s a chance you won\'t get a fun fact from GetFunFact");
      break;
    case 20:
      Log("For every non-porn webpage, there are five porn pages.");
      break;
    case 21:
      Log("At any given time, at least 0,7% of earth population is drunk.");
      break;
    case 22:
      Log(" You can\u{2019}t say happiness without saying penis.");
      break;
    default:
      Log("No fact for you. Ha ha!");
  };
}

public static exec func debug_AddLog(gameInstance: GameInstance) -> Void {
  GameInstance.GetActivityLogSystem(gameInstance).AddLog("Test line 1 lalala " + RandRange(0, 10));
  GameInstance.GetActivityLogSystem(gameInstance).AddLog("Test line 2 lalala " + RandRange(0, 10));
  GameInstance.GetActivityLogSystem(gameInstance).AddLogFromParts("Test1", "Test2", "Test3", "Test4", "Test5");
}

public static exec func AnimationSystemSetForcedVisibleTrueTest(gameInstance: GameInstance) -> Void {
  let angleDist: EulerAngles;
  let target: ref<GameObject>;
  let targetingSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  if IsDefined(targetingSystem) {
    target = targetingSystem.GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
    if IsDefined(target) {
      GameInstance.GetAnimationSystem(gameInstance).SetForcedVisible(target.GetEntityID(), true);
    } else {
      Log("Finding target failed");
    };
  } else {
    Log("Finding target system failed");
  };
}

public static exec func AnimationSystemSetForcedVisibleFalseTest(gameInstance: GameInstance) -> Void {
  let angleDist: EulerAngles;
  let target: ref<GameObject>;
  let targetingSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  if IsDefined(targetingSystem) {
    target = targetingSystem.GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
    if IsDefined(target) {
      GameInstance.GetAnimationSystem(gameInstance).SetForcedVisible(target.GetEntityID(), false);
    } else {
      Log("Finding target failed");
    };
  } else {
    Log("Finding target system failed");
  };
}

public static exec func AnimWrapperWeightSetterTest(gameInstance: GameInstance, keyStr: String, valueStr: String) -> Void {
  let angleDist: EulerAngles;
  let ev: ref<AnimWrapperWeightSetter>;
  let target: ref<GameObject>;
  let targetingSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  if IsDefined(targetingSystem) {
    target = targetingSystem.GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
    if IsDefined(target) {
      ev = new AnimWrapperWeightSetter();
      ev.key = StringToName(keyStr);
      ev.value = StringToFloat(valueStr);
      target.QueueEvent(ev);
    } else {
      Log("Finding target failed");
    };
  } else {
    Log("Finding target system failed");
  };
}

public static exec func LookAtAdd(gameInstance: GameInstance, xStr: String, yStr: String, zStr: String, part: String) -> Void {
  let angleDist: EulerAngles;
  let ev: ref<LookAtAddEvent>;
  let target: ref<GameObject>;
  let targetingSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  if IsDefined(targetingSystem) {
    target = targetingSystem.GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
    if IsDefined(target) {
      ev = new LookAtAddEvent();
      if NotEquals(part, "") {
        ev.bodyPart = StringToName(part);
      };
      ev.SetStaticTarget(new Vector4(StringToFloat(xStr), StringToFloat(yStr), StringToFloat(zStr), 1.00));
      ev.SetLimits(animLookAtLimitDegreesType.Wide, animLookAtLimitDegreesType.None, animLookAtLimitDistanceType.None, animLookAtLimitDegreesType.None);
      target.QueueEvent(ev);
    } else {
      Log("Finding target failed");
    };
  } else {
    Log("Finding target system failed");
  };
}

public static exec func LookAtAddWithOffset(gameInstance: GameInstance, xStr: String, yStr: String, zStr: String) -> Void {
  let angleDist: EulerAngles;
  let ev: ref<LookAtAddEvent>;
  let target: ref<GameObject>;
  let targetingSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  if IsDefined(targetingSystem) {
    target = targetingSystem.GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
    if IsDefined(target) {
      ev = new LookAtAddEvent();
      ev.SetEntityTarget(target, n"None", new Vector4(StringToFloat(xStr), StringToFloat(yStr), StringToFloat(zStr), 1.00));
      ev.SetLimits(animLookAtLimitDegreesType.Wide, animLookAtLimitDegreesType.None, animLookAtLimitDistanceType.None, animLookAtLimitDegreesType.None);
      target.QueueEvent(ev);
    } else {
      Log("Finding target failed");
    };
  } else {
    Log("Finding target system failed");
  };
}

public static exec func LookAtAddPlayerCameraSlot(gameInstance: GameInstance) -> Void {
  let angleDist: EulerAngles;
  let ev: ref<LookAtAddEvent>;
  let target: ref<GameObject>;
  let targetingSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  if IsDefined(targetingSystem) {
    target = targetingSystem.GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
    if IsDefined(target) {
      ev = new LookAtAddEvent();
      ev.SetEntityTarget(GetPlayer(gameInstance), n"camera", Vector4.EmptyVector());
      ev.SetLimits(animLookAtLimitDegreesType.Narrow, animLookAtLimitDegreesType.Normal, animLookAtLimitDistanceType.Normal, animLookAtLimitDegreesType.None);
      if !IsDefined(GetPlayer(gameInstance)) {
        Log("Finding player failed");
      };
      target.QueueEvent(ev);
    } else {
      Log("Finding target failed");
    };
  } else {
    Log("Finding target system failed");
  };
}

public static exec func LookAtAddPlayerCameraSlotWithHands(gameInstance: GameInstance) -> Void {
  let angleDist: EulerAngles;
  let evEyes: ref<LookAtAddEvent>;
  let evLeftHand: ref<LookAtAddEvent>;
  let evRightHand: ref<LookAtAddEvent>;
  let target: ref<GameObject>;
  let targetingSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  if IsDefined(targetingSystem) {
    target = targetingSystem.GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
    if IsDefined(target) {
      if !IsDefined(GetPlayer(gameInstance)) {
        Log("Finding player failed");
      };
      evEyes = new LookAtAddEvent();
      evEyes.SetEntityTarget(GetPlayer(gameInstance), n"camera", Vector4.EmptyVector());
      evEyes.SetLimits(animLookAtLimitDegreesType.Wide, animLookAtLimitDegreesType.None, animLookAtLimitDistanceType.None, animLookAtLimitDegreesType.None);
      target.QueueEvent(evEyes);
      evLeftHand = new LookAtAddEvent();
      evLeftHand.bodyPart = n"LeftHand";
      evLeftHand.SetEntityTarget(GetPlayer(gameInstance), n"camera", Vector4.EmptyVector());
      evLeftHand.SetLimits(animLookAtLimitDegreesType.Wide, animLookAtLimitDegreesType.None, animLookAtLimitDistanceType.None, animLookAtLimitDegreesType.None);
      target.QueueEvent(evLeftHand);
      evRightHand = new LookAtAddEvent();
      evRightHand.bodyPart = n"RightHand";
      evRightHand.SetEntityTarget(GetPlayer(gameInstance), n"camera", Vector4.EmptyVector());
      evRightHand.SetLimits(animLookAtLimitDegreesType.Wide, animLookAtLimitDegreesType.None, animLookAtLimitDistanceType.None, animLookAtLimitDegreesType.None);
      target.QueueEvent(evRightHand);
    } else {
      Log("Finding target failed");
    };
  } else {
    Log("Finding target system failed");
  };
}

public static exec func LookAtAddStaticLeftHand(gameInstance: GameInstance) -> Void {
  let angleDist: EulerAngles;
  let ev: ref<LookAtAddEvent>;
  let target: ref<GameObject>;
  let targetingSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  if IsDefined(targetingSystem) {
    target = targetingSystem.GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
    if IsDefined(target) {
      ev = new LookAtAddEvent();
      ev.bodyPart = n"LeftHand";
      ev.SetStaticTarget(new Vector4(0.50, 2.00, 1.00, 1.00));
      if !IsDefined(GetPlayer(gameInstance)) {
        Log("Finding player failed");
      };
      target.QueueEvent(ev);
    } else {
      Log("Finding target failed");
    };
  } else {
    Log("Finding target system failed");
  };
}

public static exec func SetBreathingLow(gameInstance: GameInstance) -> Void {
  let player: wref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  GameInstance.GetStatusEffectSystem(gameInstance).ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingLow", player.GetRecordID(), player.GetEntityID());
}

public static exec func SetBreathingHeavy(gameInstance: GameInstance) -> Void {
  let player: wref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  GameInstance.GetStatusEffectSystem(gameInstance).ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingHeavy", player.GetRecordID(), player.GetEntityID());
}

public static exec func SetBreathingSick(gameInstance: GameInstance) -> Void {
  let player: wref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  GameInstance.GetStatusEffectSystem(gameInstance).ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingSick", player.GetRecordID(), player.GetEntityID());
}

public static exec func SetBreathingJohnny(gameInstance: GameInstance) -> Void {
  let player: wref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  GameInstance.GetStatusEffectSystem(gameInstance).ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingJohnny", player.GetRecordID(), player.GetEntityID());
}

public static exec func SetBreathingAll(gameInstance: GameInstance) -> Void {
  let player: wref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  GameInstance.GetStatusEffectSystem(gameInstance).ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingLow", player.GetRecordID(), player.GetEntityID());
  GameInstance.GetStatusEffectSystem(gameInstance).ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingHeavy", player.GetRecordID(), player.GetEntityID());
  GameInstance.GetStatusEffectSystem(gameInstance).ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingSick", player.GetRecordID(), player.GetEntityID());
  GameInstance.GetStatusEffectSystem(gameInstance).ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingJohnny", player.GetRecordID(), player.GetEntityID());
}

public static exec func SetBreathingOff(gameInstance: GameInstance) -> Void {
  let player: wref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  GameInstance.GetStatusEffectSystem(gameInstance).RemoveStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingLow");
  GameInstance.GetStatusEffectSystem(gameInstance).RemoveStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingHeavy");
  GameInstance.GetStatusEffectSystem(gameInstance).RemoveStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingSick");
  GameInstance.GetStatusEffectSystem(gameInstance).RemoveStatusEffect(player.GetEntityID(), t"BaseStatusEffect.BreathingJohnny");
}

public static exec func DamagePlayer(gameInstance: GameInstance, TEMP_dmg: String, dmgType: String, percentage: String) -> Void {
  let attackData: ref<AttackData>;
  let hitEvent: ref<gameHitEvent>;
  let valuesLost: array<SDamageDealt>;
  let dmgVal: Float = StringToFloat(TEMP_dmg);
  let type: gamedataDamageType = IntEnum<gamedataDamageType>(Cast<Int32>(EnumValueFromString("gamedataDamageType", dmgType)));
  let attackComputed: ref<gameAttackComputed> = new gameAttackComputed();
  attackComputed.SetAttackValue(dmgVal, type);
  attackData = new AttackData();
  attackData.SetAttackType(gamedataAttackType.Ranged);
  hitEvent = new gameHitEvent();
  hitEvent.attackData = attackData;
  hitEvent.attackComputed = attackComputed;
  StatPoolsManager.ApplyDamage(hitEvent, true, valuesLost);
}

public static exec func PrintHealth(gameInst: GameInstance) -> Void {
  let player: ref<GameObject> = GetPlayer(gameInst);
  let playerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
  let valPerc: Float = GameInstance.GetStatPoolsSystem(gameInst).GetStatPoolValue(playerID, gamedataStatPoolType.Health);
  let val: Float = GameInstance.GetStatPoolsSystem(gameInst).ToPoints(playerID, gamedataStatPoolType.Health, valPerc);
  Log("StatPool: " + EnumValueToString("gamedataStatPoolType", Cast<Int64>(EnumInt(gamedataStatPoolType.Health))));
  Log("Stat %: " + FloatToString(valPerc));
  Log("Stat value: " + FloatToString(val));
}

public static exec func ChangeStatPoolVal(inst: GameInstance, type: String, value: String, opt subtract: String, opt percentage: String) -> Void {
  let factor: Float;
  let player: ref<GameObject>;
  let playerID: StatsObjectID;
  let statPoolSystem: ref<StatPoolsSystem>;
  let statType: gamedataStatPoolType;
  let statVal: Float;
  if StringToBool(subtract) {
    factor = -1.00;
  } else {
    factor = 1.00;
  };
  player = GetPlayer(inst);
  playerID = Cast<StatsObjectID>(player.GetEntityID());
  statVal = StringToFloat(value);
  statType = IntEnum<gamedataStatPoolType>(Cast<Int32>(EnumValueFromString("gamedataStatPoolType", type)));
  statPoolSystem = GameInstance.GetStatPoolsSystem(inst);
  statPoolSystem.RequestChangingStatPoolValue(playerID, statType, statVal * factor, null, false, StringToBool(percentage));
}

public static exec func Heal(gi: GameInstance, opt valStr: String, opt isScalarStr: String) -> Void {
  let isScalar: Bool;
  let playerID: StatsObjectID = Cast<StatsObjectID>(GetPlayer(gi).GetEntityID());
  let statPoolsSystem: ref<StatPoolsSystem> = GameInstance.GetStatPoolsSystem(gi);
  let val: Float = StringToFloat(valStr);
  if FloatIsEqual(val, 0.00) {
    statPoolsSystem.RequestSettingStatPoolMaxValue(playerID, gamedataStatPoolType.Health, null);
    return;
  };
  if val <= 0.00 {
    return;
  };
  isScalar = StringToBool(isScalarStr);
  if isScalar {
    val = statPoolsSystem.ToPercentage(playerID, gamedataStatPoolType.Health, val);
  };
  statPoolsSystem.RequestSettingStatPoolValue(playerID, gamedataStatPoolType.Health, val, null);
}

public static exec func God1(gi: GameInstance) -> Void {
  SwitchPlayerImmortalityMode(gi, gamecheatsystemFlag.God_Immortal);
}

public static exec func God2(gi: GameInstance) -> Void {
  SwitchPlayerImmortalityMode(gi, gamecheatsystemFlag.God_Invulnerable);
}

public static exec func ToggleShowWeaponsStreaming(gi: GameInstance) -> Void {
  let player: ref<PlayerPuppet> = GetPlayerObject(gi) as PlayerPuppet;
  if IsDefined(player) && IsDefined(player.DEBUG_Visualizer) {
    player.DEBUG_Visualizer.ToggleShowWeaponsStreaming();
  };
}

public static exec func GodClearAll(gi: GameInstance) -> Void {
  let cheatSystem: ref<DebugCheatsSystem> = GameInstance.GetDebugCheatsSystem(gi);
  let player: ref<GameObject> = GetPlayerObject(gi);
  cheatSystem.EnableCheat(player, gamecheatsystemFlag.God_Immortal, false);
  cheatSystem.EnableCheat(player, gamecheatsystemFlag.God_Invulnerable, false);
}

public static exec func Weak(gameInstance: GameInstance, modeStr: String) -> Void {
  let mode: Int32 = StringToInt(modeStr);
  SetFactValue(gameInstance, n"cheat_weak", mode);
  LogStats("Weak cheat mode changed to " + IntToString(mode));
}

public static exec func OP(gameInstance: GameInstance, modeStr: String) -> Void {
  let mode: Int32 = StringToInt(modeStr);
  SetFactValue(gameInstance, n"cheat_op", mode);
  LogStats("OP cheat mode changed to " + IntToString(mode));
}

public static exec func IDDQD(gi: GameInstance, opt iamstiffcorpoguy: String) -> Void {
  if StringToBool(iamstiffcorpoguy) {
    SetFactValue(gi, n"legacy_mode_is_on", 0);
    SetFactValue(gi, n"legacy_hits_on", 0);
    SetFactValue(gi, n"legacy_mode_is_disabled", 1);
  } else {
    SetFactValue(gi, n"legacy_mode_is_on", 1);
    SetFactValue(gi, n"legacy_hits_on", 1);
    SetFactValue(gi, n"legacy_mode_is_disabled", 0);
  };
}

public static exec func Kill(gameInstance: GameInstance) -> Void {
  if GameInstance.GetRuntimeInfo(gameInstance).IsMultiplayer() {
    LogError("exec(Kill) does not work in multiplayer, use 'K' key instead");
    return;
  };
  Kill_NonExec(gameInstance, GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet);
}

public static exec func KillAll(gameInstance: GameInstance, radiusStr: String) -> Void {
  if GameInstance.GetRuntimeInfo(gameInstance).IsMultiplayer() {
    LogError("exec(Kill) does not work in multiplayer, use 'L' key instead");
    return;
  };
  KillAll_NonExec(gameInstance, GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet, radiusStr);
}

public static exec func HealAll(gameInstance: GameInstance, opt radiusStr: String) -> Void {
  let gameEffectInstance: ref<EffectInstance>;
  let player: ref<PlayerPuppet>;
  let radius: Float = StringToFloat(radiusStr);
  if FloatIsEqual(radius, 0.00) {
    radius = 20.00;
  };
  player = GetPlayer(gameInstance);
  gameEffectInstance = GameInstance.GetGameEffectSystem(gameInstance).CreateEffectStatic(n"healAll", n"healAll", player);
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, player.GetWorldPosition());
  EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.radius, radius);
  gameEffectInstance.Run();
}

public static exec func PrintNPCItemBySlot(gi: GameInstance, slotName: String) -> Void {
  let item: ref<ItemObject>;
  let itemID: ItemID;
  let itemName: String;
  let slotID: TweakDBID;
  let localPlayer: ref<GameObject> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject();
  let target: ref<GameObject> = GameInstance.GetTargetingSystem(gi).GetLookAtObject(localPlayer);
  if !IsDefined(target) {
    Log("PrintNPCItemBySlot(): No valid target found!");
    return;
  };
  slotID = TDBID.Create("AttachmentSlots." + slotName);
  item = GameInstance.GetTransactionSystem(gi).GetItemInSlot(target, slotID);
  if !IsDefined(item) {
    return;
  };
  itemID = item.GetItemID();
  itemName = TweakDBInterface.GetItemRecord(ItemID.GetTDBID(itemID)).FriendlyName();
  Log("PrintNPCItemBySlot(): Item in slot: " + slotName + " : " + itemName);
}

public static exec func PrintDPS(gi: GameInstance) -> Void {
  let obj: ref<GameObject> = GameInstance.GetTransactionSystem(gi).GetItemInSlot(GetPlayer(gi), t"AttachmentSlots.WeaponRight");
  let dps: DPSPackage = StatsManager.GetObjectDPS(obj);
  LogStats(EnumValueToString("gamedataDamageType", Cast<Int64>(EnumInt(dps.type))));
  LogStats(FloatToString(dps.value));
}

public static exec func GetAllPerks(gi: GameInstance) -> Void {
  let playerDevData: ref<PlayerDevelopmentData> = PlayerDevelopmentSystem.GetData(GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject());
  let i: Int32 = 0;
  while i < EnumInt(gamedataPerkType.Count) {
    playerDevData.BuyPerk(IntEnum<gamedataPerkType>(i));
    i += 1;
  };
}

public static exec func GetQuickhacks(gi: GameInstance) -> Void {
  let ts: ref<TransactionSystem> = GameInstance.GetTransactionSystem(gi);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.SuicideLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.SuicideLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BlindProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BlindLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BlindLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BlindLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.GrenadeExplodeLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.GrenadeExplodeLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.EMPOverloadProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.EMPOverloadLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.EMPOverloadLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.EMPOverloadLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BrainMeltProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BrainMetlLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BrainMeltLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BrainMeltLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.MadnessLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.MadnessLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsNoiseProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsNoiseLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsNoiseLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsNoiseLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsCallInProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsCallInLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsCallInLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsCallInLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.DisableCyberwareProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.DisableCyberwareLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.OverheatProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.OverheatLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.OverheatLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.OverheatLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.SystemCollapseLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.SystemCollapseLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WeaponMalfunctionProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WeaponMalfunctionLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WeaponMalfunctionLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WeaponMalfunctionLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.LocomotionMalfunctionLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.LocomotionMalfunctionLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.LocomotionMalfunctionLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.LocomotionMalfunctionProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WhistleProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WhistleLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WhistleLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.MemoryWipeLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.MemoryWipeLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.PingProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.PingLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.PingLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.PingLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.ContagionProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.ContagionLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.ContagionLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.ContagionLvl4Program", 1);
}

public static exec func EnableFinishers(gi: GameInstance, enable: String) -> Void {
  let val: Bool = StringToBool(enable);
  if val {
    GameInstance.GetQuestsSystem(gi).SetFact(n"DEBUG_FINISHERS_ENABLED", 1);
  } else {
    GameInstance.GetQuestsSystem(gi).SetFact(n"DEBUG_FINISHERS_ENABLED", 0);
  };
}

public static exec func InfiniteStamina(gi: GameInstance, opt enable: String) -> Void {
  let mod: StatPoolModifier;
  let playerID: StatsObjectID;
  let statPoolSys: ref<StatPoolsSystem>;
  let toEnable: Bool = true;
  if NotEquals(enable, "") {
    toEnable = StringToBool(enable);
  };
  playerID = Cast<StatsObjectID>(GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject().GetEntityID());
  statPoolSys = GameInstance.GetStatPoolsSystem(gi);
  if toEnable {
    mod.enabled = true;
    mod.rangeBegin = 0.00;
    mod.rangeEnd = 100.00;
    mod.delayOnChange = false;
    mod.valuePerSec = 1000000000.00;
    statPoolSys.RequestSettingModifier(playerID, gamedataStatPoolType.Stamina, gameStatPoolModificationTypes.Regeneration, mod);
  } else {
    statPoolSys.RequestResetingModifier(playerID, gamedataStatPoolType.Stamina, gameStatPoolModificationTypes.Regeneration);
  };
}

public static exec func NetrunnerTesting(gi: GameInstance) -> Void {
  let equipRequest: ref<EquipRequest>;
  let equipSys: ref<EquipmentSystem>;
  let itemID: ItemID;
  let itemTDBID: TweakDBID;
  let playerID: EntityID;
  let statusEffectSystem: ref<StatusEffectSystem>;
  let ts: ref<TransactionSystem> = GameInstance.GetTransactionSystem(gi);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.SuicideProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.SuicideLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BlindProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BlindLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BlindLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BlindLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.GrenadeExplodeProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.GrenadeExplodeLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.EMPOverloadProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.EMPOverloadLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.EMPOverloadLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.EMPOverloadLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.MadnessProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.MadnessLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsNoiseProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsNoiseLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsNoiseLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsNoiseLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsCallInProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsCallInLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsCallInLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.CommsCallInLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WhistleProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WhistleLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WhistleLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.DisableCyberwareProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.DisableCyberwareLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.DisableCyberwareLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.DisableCyberwareLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.OverheatProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.OverheatLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.OverheatLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.OverheatLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.SystemCollapseProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.SystemCollapseLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WeaponMalfunctionProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WeaponMalfunctionLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WeaponMalfunctionLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.WeaponMalfunctionLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.LocomotionMalfunctionLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.LocomotionMalfunctionLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.LocomotionMalfunctionLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.LocomotionMalfunctionProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.PingProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.PingLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.PingLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.PingLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.MemoryWipeLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.MemoryWipeLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BrainMeltLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BrainMeltLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.BrainMeltLvl4Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.ContagionProgram", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.ContagionLvl2Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.ContagionLvl3Program", 1);
  ts.GiveItemByTDBID(GetPlayer(gi), t"Items.ContagionLvl4Program", 1);
  playerID = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject().GetEntityID();
  itemTDBID = t"TEST.CyberdeckHybridMid";
  itemID = ItemID.FromTDBID(itemTDBID);
  equipRequest = new EquipRequest();
  equipRequest.itemID = itemID;
  equipRequest.owner = GetPlayer(gi);
  equipRequest.addToInventory = true;
  equipSys = GameInstance.GetScriptableSystemsContainer(gi).Get(n"EquipmentSystem") as EquipmentSystem;
  equipSys.QueueRequest(equipRequest);
  statusEffectSystem = GameInstance.GetStatusEffectSystem(gi);
  if statusEffectSystem.HasStatusEffect(playerID, t"TEST.UltimateNetrunner") {
    GameInstance.GetStatusEffectSystem(gi).RemoveStatusEffect(playerID, t"TEST.UltimateNetrunner");
  } else {
    GameInstance.GetStatusEffectSystem(gi).ApplyStatusEffect(playerID, t"TEST.UltimateNetrunner");
  };
}

public static exec func SpawnEffect(gameInstance: GameInstance, effectName: CName) -> Void {
  let angleDist: EulerAngles;
  let ev: ref<entSpawnEffectEvent> = new entSpawnEffectEvent();
  ev.effectName = effectName;
  ev.effectInstanceName = n"_ExecSpawnEffect";
  let target: ref<GameObject> = GameInstance.GetTargetingSystem(gameInstance).GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
  if IsDefined(target) {
    target.QueueEvent(ev);
  };
}

public static exec func KillEffect(gameInstance: GameInstance) -> Void {
  let angleDist: EulerAngles;
  let ev: ref<entKillEffectEvent> = new entKillEffectEvent();
  ev.effectName = n"_ExecSpawnEffect";
  let target: ref<GameObject> = GameInstance.GetTargetingSystem(gameInstance).GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
  if IsDefined(target) {
    target.QueueEvent(ev);
  };
}

public static exec func BreakEffectLoop(gameInstance: GameInstance) -> Void {
  let angleDist: EulerAngles;
  let ev: ref<entBreakEffectLoopEvent> = new entBreakEffectLoopEvent();
  ev.effectName = n"_ExecSpawnEffect";
  let target: ref<GameObject> = GameInstance.GetTargetingSystem(gameInstance).GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
  if IsDefined(target) {
    target.QueueEvent(ev);
  };
}

public static exec func EquipItem(inst: GameInstance, itemTDBIDStr: String) -> Void {
  let equipRequest: ref<GameplayEquipRequest>;
  let equipSys: ref<EquipmentSystem>;
  let placementSlots: array<wref<AttachmentSlot_Record>>;
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(inst).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let itemTDBID: TweakDBID = TDBID.Create(itemTDBIDStr);
  let itemID: ItemID = ItemID.FromTDBID(itemTDBID);
  TweakDBInterface.GetItemRecord(itemTDBID).PlacementSlots(placementSlots);
  equipRequest = new GameplayEquipRequest();
  equipRequest.itemID = itemID;
  equipRequest.owner = player;
  equipRequest.addToInventory = true;
  equipRequest.blockUpdateWeaponActiveSlots = true;
  equipSys = GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem") as EquipmentSystem;
  equipSys.QueueRequest(equipRequest);
}

public static exec func EquipVisuals(gi: GameInstance, itemTDBIDStr: String) -> Void {
  let equipRequest: ref<EquipVisualsRequest>;
  let equipSys: ref<EquipmentSystem>;
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let itemTDBID: TweakDBID = TDBID.Create(itemTDBIDStr);
  let itemID: ItemID = ItemID.FromTDBID(itemTDBID);
  GameInstance.GetTransactionSystem(gi).GiveItem(player, itemID, 1);
  equipRequest = new EquipVisualsRequest();
  equipRequest.itemID = itemID;
  equipRequest.owner = player;
  equipSys = GameInstance.GetScriptableSystemsContainer(gi).Get(n"EquipmentSystem") as EquipmentSystem;
  equipSys.QueueRequest(equipRequest);
}

public static exec func UnequipVisuals(gi: GameInstance, areaString: String) -> Void {
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let area: gamedataEquipmentArea = IntEnum<gamedataEquipmentArea>(Cast<Int32>(EnumValueFromString("gamedataEquipmentArea", areaString)));
  let unequipRequest: ref<UnequipVisualsRequest> = new UnequipVisualsRequest();
  unequipRequest.area = area;
  unequipRequest.owner = player;
  unequipRequest.removeItem = true;
  let equipSys: ref<EquipmentSystem> = GameInstance.GetScriptableSystemsContainer(gi).Get(n"EquipmentSystem") as EquipmentSystem;
  equipSys.QueueRequest(unequipRequest);
}

public static exec func EquipItemToHand(inst: GameInstance, itemTDBIDStr: String) -> Void {
  let drawItemRequest: ref<DrawItemRequest>;
  let equipRequest: ref<EquipRequest>;
  let equipSys: ref<EquipmentSystem>;
  let placementSlots: array<wref<AttachmentSlot_Record>>;
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(inst).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let itemTDBID: TweakDBID = TDBID.Create(itemTDBIDStr);
  let itemID: ItemID = ItemID.FromTDBID(itemTDBID);
  TweakDBInterface.GetItemRecord(itemTDBID).PlacementSlots(placementSlots);
  equipRequest = new EquipRequest();
  equipRequest.itemID = itemID;
  equipRequest.owner = player;
  equipRequest.addToInventory = true;
  equipSys = GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem") as EquipmentSystem;
  equipSys.QueueRequest(equipRequest);
  drawItemRequest = new DrawItemRequest();
  drawItemRequest.owner = player;
  drawItemRequest.itemID = itemID;
  equipSys.QueueRequest(drawItemRequest);
}

/*
public static exec func InstallProgram(inst: GameInstance, part: String, slot: String) -> Void {
  let itemModSys: ref<ItemModificationSystem> = GameInstance.GetScriptableSystemsContainer(inst).Get(n"ItemModificationSystem") as ItemModificationSystem;
  let installRequest: ref<SwapItemPart> = new SwapItemPart();
  let player: wref<GameObject> = GameInstance.GetPlayerSystem(inst).GetLocalPlayerMainGameObject();
  installRequest.obj = player;
  installRequest.baseItem = EquipmentSystem.GetData(player).GetActiveItem(gamedataEquipmentArea.SystemReplacementCW);
  installRequest.slotID = TDBID.Create(slot);
  let partID: ItemID = ItemID.FromTDBID(TDBID.Create(part));
  installRequest.partToInstall = partID;
  GameInstance.GetTransactionSystem(inst).GiveItem(player, partID, 1);
  itemModSys.QueueRequest(installRequest);
}
*/

public static exec func GetItemInSlot(inst: GameInstance, slotString: String) -> Void {
  let slotID: TweakDBID = TDBID.Create(slotString);
  let item: ref<ItemObject> = GameInstance.GetTransactionSystem(inst).GetItemInSlot(GetPlayer(inst), slotID);
  Log(item.GetItemData().GetNameAsString());
}

public static exec func UnequipItem(inst: GameInstance, stringType: String, stringSlot: String) -> Void {
  let unequipRequest: ref<UnequipRequest> = new UnequipRequest();
  let areaType: gamedataEquipmentArea = IntEnum<gamedataEquipmentArea>(Cast<Int32>(EnumValueFromString("gamedataEquipmentArea", stringType)));
  unequipRequest.areaType = areaType;
  unequipRequest.slotIndex = StringToInt(stringSlot);
  unequipRequest.owner = GetPlayer(inst);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem").QueueRequest(unequipRequest);
}

public static exec func ClearEquipment(inst: GameInstance) -> Void {
  let clearRequest: ref<ClearEquipmentRequest> = new ClearEquipmentRequest();
  clearRequest.owner = GetPlayer(inst);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem").QueueRequest(clearRequest);
}

public static exec func SaveWeaponSet(inst: GameInstance, setName: String) -> Void {
  let saveSetRequest: ref<SaveEquipmentSetRequest> = new SaveEquipmentSetRequest();
  saveSetRequest.owner = GetPlayer(inst);
  saveSetRequest.setName = setName;
  saveSetRequest.setType = EEquipmentSetType.Offensive;
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem").QueueRequest(saveSetRequest);
}

public static exec func SaveArmorSet(inst: GameInstance, setName: String) -> Void {
  let saveSetRequest: ref<SaveEquipmentSetRequest> = new SaveEquipmentSetRequest();
  saveSetRequest.owner = GetPlayer(inst);
  saveSetRequest.setName = setName;
  saveSetRequest.setType = EEquipmentSetType.Defensive;
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem").QueueRequest(saveSetRequest);
}

public static exec func LoadEquipmentSet(inst: GameInstance, setName: String) -> Void {
  let loadSetRequest: ref<LoadEquipmentSetRequest> = new LoadEquipmentSetRequest();
  loadSetRequest.owner = GetPlayer(inst);
  loadSetRequest.setName = setName;
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem").QueueRequest(loadSetRequest);
}

public static exec func DeleteEquipmentSet(inst: GameInstance, setName: String) -> Void {
  let deleteSetRequest: ref<DeleteEquipmentSetRequest> = new DeleteEquipmentSetRequest();
  deleteSetRequest.owner = GetPlayer(inst);
  deleteSetRequest.setName = setName;
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem").QueueRequest(deleteSetRequest);
}

public static exec func PrintEquipment(inst: GameInstance) -> Void {
  let equipmentSystem: ref<EquipmentSystem> = GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem") as EquipmentSystem;
  equipmentSystem.PrintEquipment();
}

/*
public static exec func AddToInventory(inst: GameInstance, itemString: String, opt quantityString: String) -> Void {
  let equipmentUIBBRequest: ref<EquipmentUIBBRequest>;
  let itemID: ItemID;
  let quantity: Int32 = StringToInt(quantityString);
  if quantity <= 0 {
    quantity = 1;
  };
  itemID = ItemID.FromTDBID(TDBID.Create(itemString));
  GameInstance.GetTransactionSystem(inst).GiveItem(GetPlayer(inst), itemID, quantity);
  equipmentUIBBRequest = new EquipmentUIBBRequest();
  equipmentUIBBRequest.owner = GetPlayer(inst);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem").QueueRequest(equipmentUIBBRequest);
}
*/

public static exec func AddItems(inst: GameInstance, type: String, opt amount: String) -> Void {
  let itemID: ItemID;
  let quantity: Int32 = StringToInt(amount, 1);
  let tweakPath: TweakDBID = TDBID.Create("Debug." + type + ".items");
  let itemsArray: array<String> = TDB.GetStringArray(tweakPath);
  let i: Int32 = 0;
  while i <= ArraySize(itemsArray) {
    itemID = ItemID.FromTDBID(TDBID.Create(itemsArray[i]));
    GameInstance.GetTransactionSystem(inst).GiveItem(GetPlayer(inst), itemID, quantity);
    i += 1;
  };
}

public static exec func AddRecord(inst: GameInstance, tweak: String) -> Void {
  let codexSystem: ref<CodexSystem> = GameInstance.GetScriptableSystemsContainer(inst).Get(n"CodexSystem") as CodexSystem;
  let addRecordRequest: ref<CodexAddRecordRequest> = new CodexAddRecordRequest();
  addRecordRequest.codexRecordID = TDBID.Create(tweak);
  codexSystem.QueueRequest(addRecordRequest);
}

public static exec func UnlockRecord(inst: GameInstance, tweak: String) -> Void {
  let codexSystem: ref<CodexSystem> = GameInstance.GetScriptableSystemsContainer(inst).Get(n"CodexSystem") as CodexSystem;
  let unlockRecordRequest: ref<CodexUnlockRecordRequest> = new CodexUnlockRecordRequest();
  unlockRecordRequest.codexRecordID = TDBID.Create(tweak);
  codexSystem.QueueRequest(unlockRecordRequest);
}

public static exec func PrintCodex(inst: GameInstance) -> Void {
  let codexSystem: ref<CodexSystem> = GameInstance.GetScriptableSystemsContainer(inst).Get(n"CodexSystem") as CodexSystem;
  let codexPrintRecordsRequest: ref<CodexPrintRecordsRequest> = new CodexPrintRecordsRequest();
  codexSystem.QueueRequest(codexPrintRecordsRequest);
}

public static exec func SM(gi: GameInstance) -> Void {
  let crack: ref<CrackAction> = new CrackAction();
  crack.CompleteAction(gi);
}

public static exec func GiveItem(gi: GameInstance, itemName: String, opt amountStr: String) -> Void {
  let transSys: ref<TransactionSystem> = GameInstance.GetTransactionSystem(gi);
  let amount: Int32 = StringToInt(amountStr);
  if amount == 0 {
    amount = 1;
  };
  transSys.GiveItem(GetPlayer(gi), ItemID.FromTDBID(TDBID.Create(itemName)), amount);
}

public static exec func PrintItems(gi: GameInstance) -> Void {
  let i: Int32;
  let itemID: ItemID;
  let itemList: array<wref<gameItemData>>;
  let quantity: Int32;
  let str: String;
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let trans: ref<TransactionSystem> = GameInstance.GetTransactionSystem(gi);
  trans.GetItemList(player, itemList);
  LogItems("");
  LogItems("--== Printing inventory contents of player:");
  i = 0;
  while i < ArraySize(itemList) {
    itemID = itemList[i].GetID();
    quantity = trans.GetItemQuantity(player, itemID);
    str = SpaceFill(IntToString(quantity), 6, ESpaceFillMode.JustifyRight) + "x " + TDBID.ToStringDEBUG(ItemID.GetTDBID(itemID));
    LogItems(str);
    i += 1;
  };
  LogItems("--== End of inventory contents of player");
}

public static exec func PrintStatsItem(gi: GameInstance, itemName: String) -> Void {
  let i: Int32;
  let objectID: StatsObjectID;
  let stats: ref<StatsSystem>;
  let valF: Float;
  let itemTDBID: TweakDBID = TDBID.Create("Items." + itemName);
  let itemID: ItemID = ItemID.CreateQuery(itemTDBID);
  let transSys: ref<TransactionSystem> = GameInstance.GetTransactionSystem(gi);
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let object: ref<GameObject> = transSys.GetItemInSlotByItemID(player, itemID);
  LogStats("");
  if !IsDefined(object) {
    LogStats("exec PrintStatsItem(): cannot find item object with specified ID \'" + Cast<Bool>(TDBID.ToNumber(itemTDBID)) + "\'");
    return;
  };
  objectID = Cast<StatsObjectID>(object.GetEntityID());
  stats = GameInstance.GetStatsSystem(gi);
  LogStats("---- stats of item \'" + Cast<Bool>(TDBID.ToNumber(itemTDBID)) + "\' ----");
  i = 0;
  while i <= Cast<Int32>(EnumGetMax(n"gamedataStatType")) {
    valF = stats.GetStatValue(objectID, IntEnum<gamedataStatType>(i));
    if !FloatIsEqual(valF, 0.00) {
      LogStats(EnumValueToString("gamedataStatType", Cast<Int64>(i)) + ": " + NoTrailZeros(FloatToString(valF)));
    };
    i += 1;
  };
  LogStats("---- end of stats of item \'" + Cast<Bool>(TDBID.ToNumber(itemTDBID)) + "\' ----");
}

public static exec func EquipItemOnPlayer(gi: GameInstance, item: String, slot: String) -> Void {
  GameInstance.GetTransactionSystem(gi).AddItemToSlot(GetPlayer(gi), TDBID.Create("AttachmentSlots." + slot), ItemID.FromTDBID(TDBID.Create(item)));
}

public static func PrintItemInSlot(gi: GameInstance, object: ref<GameObject>, slot: TweakDBID) -> Void {
  let slotName: String = TweakDBInterface.GetAttachmentSlotRecord(slot).EntitySlotName();
  let itemObj: ref<ItemObject> = GameInstance.GetTransactionSystem(gi).GetItemInSlot(object as PlayerPuppet, slot);
  if !IsDefined(itemObj) {
    LogItems("Item in slot: " + slotName + " NULL ");
    return;
  };
  LogItems("Item in slot: " + slotName + " : " + TweakDBInterface.GetItemRecord(ItemID.GetTDBID(itemObj.GetItemID())).FriendlyName());
}

public static exec func PrintItemsInSlots(gi: GameInstance) -> Void {
  let i: Int32;
  let slots: array<wref<AttachmentSlot_Record>>;
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  TweakDBInterface.GetCharacterRecord(player.GetRecordID()).AttachmentSlots(slots);
  i = 0;
  while i < ArraySize(slots) {
    PrintItemInSlot(gi, player, slots[i].GetID());
    i += 1;
  };
}

public static exec func PrintNPCItems(gi: GameInstance) -> Void {
  let i: Int32;
  let itemName: String;
  let items: array<wref<gameItemData>>;
  let target: ref<GameObject> = GameInstance.GetTargetingSystem(gi).GetLookAtObject(GetPlayer(gi));
  if !IsDefined(target) {
    Log("PrintNPCItems(): No valid target found!");
    return;
  };
  GameInstance.GetTransactionSystem(gi).GetItemList(target, items);
  i = 0;
  while i < ArraySize(items) {
    itemName = TweakDBInterface.GetItemRecord(ItemID.GetTDBID(items[i].GetID())).FriendlyName();
    LogItems("Item name: " + itemName + ", Quantity: " + IntToString(items[i].GetQuantity()));
    i += 1;
  };
}

/*
public static exec func SwapItemPart(gi: GameInstance) -> Void {
  let req: ref<SwapItemPart>;
  let weaponID: ItemID;
  let ts: ref<TransactionSystem> = GameInstance.GetTransactionSystem(gi);
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let partID: ItemID = ItemID.FromTDBID(t"Items.w_rifle_assault__nokota_copperhead__mag_std_maelstrom");
  ts.GiveItem(player, partID, 1);
  weaponID = ItemID.CreateQuery(t"Items.Base_Copperhead");
  req = new SwapItemPart();
  req.obj = player;
  req.baseItem = weaponID;
  req.partToInstall = partID;
  req.slotID = t"AttachmentSlots.Magazine";
  GameInstance.GetScriptableSystemsContainer(gi).Get(n"ItemModificationSystem").QueueRequest(req);
}
*/

public static exec func ToggleFlashlight(gi: GameInstance, val: String) -> Void {
  let evt: ref<TogglePlayerFlashlightEvent> = new TogglePlayerFlashlightEvent();
  evt.enable = StringToBool(val);
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  player.QueueEvent(evt);
}

public static exec func Rev(gi: GameInstance) -> Void {
  let equipRequest: ref<EquipRequest>;
  let id: ItemID;
  let ts: ref<TransactionSystem> = GameInstance.GetTransactionSystem(gi);
  let pl: ref<PlayerPuppet> = GetPlayer(gi);
  let equipSys: ref<EquipmentSystem> = GameInstance.GetScriptableSystemsContainer(gi).Get(n"EquipmentSystem") as EquipmentSystem;
  ts.GiveItemByTDBID(pl, t"Items.Preset_Saratoga_Default", 1);
  ts.GiveItemByTDBID(pl, t"Items.Preset_Sidewinder_Default", 1);
  ts.GiveItemByTDBID(pl, t"Items.Preset_Zhuo_Default", 1);
  ts.GiveItemByTDBID(pl, t"Items.Preset_Ashura_Default", 1);
  ts.GiveItemByTDBID(pl, t"Items.Preset_Copperhead_Military1", 1);
  ts.GiveItemByTDBID(pl, t"Items.Preset_Burya_Default", 1);
  ts.GiveItemByTDBID(pl, t"Items.SuicideProgram", 1);
  ts.GiveItemByTDBID(pl, t"Items.MadnessProgram", 1);
  ts.GiveItemByTDBID(pl, t"Items.MalfunctionProgram", 1);
  ts.GiveItemByTDBID(pl, t"Items.TakeControlProgram", 1);
  ts.GiveItemByTDBID(pl, t"Items.SystemCollapseProgram", 1);
  ts.GiveItemByTDBID(pl, t"Items.CommsCallProgram", 1);
  ts.GiveItemByTDBID(pl, t"Items.w_att_scope_short_01", 1);
  ts.GiveItemByTDBID(pl, t"Items.w_att_scope_short_02", 1);
  ts.GiveItemByTDBID(pl, t"Items.w_att_scope_short_03", 1);
  ts.GiveItemByTDBID(pl, t"Items.w_att_scope_long_01", 1);
  ts.GiveItemByTDBID(pl, t"Items.w_att_scope_long_02", 1);
  ts.GiveItemByTDBID(pl, t"Items.w_att_scope_long_03", 1);
  ts.GiveItemByTDBID(pl, t"Items.w_silencer_01", 1);
  ts.GiveItemByTDBID(pl, t"Items.GrenadeFragRegular", 3);
  ts.GiveItemByTDBID(pl, t"Items.GrenadeFlashRegularV0", 3);
  ts.GiveItemByTDBID(pl, t"Items.GrenadeSonicBubbleSticky", 3);
  ts.GiveItemByTDBID(pl, t"Items.FirstAidWhiff", 3);
  id = ItemID.FromTDBID(t"Items.MilitechParaline");
  ts.GiveItem(pl, id, 1);
  equipRequest = new EquipRequest();
  equipRequest.itemID = id;
  equipRequest.owner = pl;
  equipSys.QueueRequest(equipRequest);
  id = ItemID.FromTDBID(t"Items.OpticalCamo");
  ts.GiveItem(pl, id, 1);
  equipRequest = new EquipRequest();
  equipRequest.itemID = id;
  equipRequest.owner = pl;
  equipSys.QueueRequest(equipRequest);
  id = ItemID.FromTDBID(t"Items.SmartLink");
  ts.GiveItem(pl, id, 1);
  equipRequest = new EquipRequest();
  equipRequest.itemID = id;
  equipRequest.owner = pl;
  equipSys.QueueRequest(equipRequest);
  id = ItemID.FromTDBID(t"Items.BoostedTendons");
  ts.GiveItem(pl, id, 1);
  equipRequest = new EquipRequest();
  equipRequest.itemID = id;
  equipRequest.owner = pl;
  equipSys.QueueRequest(equipRequest);
}

public static exec func SetLevel(inst: GameInstance, stringType: String, stringVal: String) -> Void {
  PlayerPuppet.SetLevel(inst, stringType, stringVal, telemetryLevelGainReason.IsDebug);
}

public static exec func AddExp(inst: GameInstance, stringType: String, stringVal: String) -> Void {
  let expType: gamedataProficiencyType = IntEnum<gamedataProficiencyType>(Cast<Int32>(EnumValueFromString("gamedataProficiencyType", stringType)));
  let expAmount: Int32 = StringToInt(stringVal);
  let expRequest: ref<AddExperience> = new AddExperience();
  expRequest.Set(GetPlayer(inst), expAmount, expType, true);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"PlayerDevelopmentSystem").QueueRequest(expRequest);
}

/*
public static exec func BuyPerk(inst: GameInstance, pString: String) -> Void {
  let pType: gamedataPerkType = IntEnum<gamedataPerkType>(Cast<Int32>(EnumValueFromString("gamedataPerkType", pString)));
  let request: ref<BuyPerk> = new BuyPerk();
  request.Set(GetPlayer(inst), pType);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"PlayerDevelopmentSystem").QueueRequest(request);
}

public static exec func RemovePerk(inst: GameInstance, pString: String) -> Void {
  let pType: gamedataPerkType = IntEnum<gamedataPerkType>(Cast<Int32>(EnumValueFromString("gamedataPerkType", pString)));
  let request: ref<RemovePerk> = new RemovePerk();
  request.Set(GetPlayer(inst), pType);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"PlayerDevelopmentSystem").QueueRequest(request);
}
*/

public static exec func GiveDevPoints(inst: GameInstance, stringType: String, stringVal: String) -> Void {
  let devPtsType: gamedataDevelopmentPointType = IntEnum<gamedataDevelopmentPointType>(Cast<Int32>(EnumValueFromString("gamedataDevelopmentPointType", stringType)));
  let devPtsAmount: Int32 = StringToInt(stringVal);
  let request: ref<AddDevelopmentPoints> = new AddDevelopmentPoints();
  request.Set(GetPlayer(inst), devPtsAmount, devPtsType);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"PlayerDevelopmentSystem").QueueRequest(request);
}

public static exec func BuyAtt(inst: GameInstance, stringType: String) -> Void {
  let attType: gamedataStatType = IntEnum<gamedataStatType>(Cast<Int32>(EnumValueFromString("gamedataStatType", stringType)));
  let request: ref<BuyAttribute> = new BuyAttribute();
  request.Set(GetPlayer(inst), attType);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"PlayerDevelopmentSystem").QueueRequest(request);
}

public static exec func SetAtt(inst: GameInstance, stringType: String, stringVal: String) -> Void {
  let attType: gamedataStatType = IntEnum<gamedataStatType>(Cast<Int32>(EnumValueFromString("gamedataStatType", stringType)));
  let attValue: Float = StringToFloat(stringVal);
  let request: ref<SetAttribute> = new SetAttribute();
  request.Set(GetPlayer(inst), attValue, attType);
  GameInstance.GetScriptableSystemsContainer(inst).Get(n"PlayerDevelopmentSystem").QueueRequest(request);
}

public static exec func PrintAttributes(inst: GameInstance) -> Void {
  let val: Int32;
  let player: ref<PlayerPuppet> = GetPlayer(inst);
  let statSys: ref<StatsSystem> = GameInstance.GetStatsSystem(player.GetGame());
  let playerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
  let i: Int32 = 0;
  while i <= EnumInt(gamedataStatType.Count) {
    val = Cast<Int32>(statSys.GetStatValue(playerID, IntEnum<gamedataStatType>(i)));
    Log(EnumValueToString("gamedataStatType", Cast<Int64>(i)) + ": " + IntToString(val));
    i += 1;
  };
}

public static exec func SetBuild(inst: GameInstance, stringType: String) -> Void {
  PlayerPuppet.SetBuild(inst, stringType);
}

public static exec func PrintProfs(inst: GameInstance) -> Void {
  let i: Int32 = 0;
  while i < EnumInt(gamedataProficiencyType.Count) {
    LogDM("Proficiency: " + EnumValueToString("gamedataProficiencyType", Cast<Int64>(i)) + " current level is - " + (GameInstance.GetScriptableSystemsContainer(inst).Get(n"PlayerDevelopmentSystem") as PlayerDevelopmentSystem).GetProficiencyLevel(GetPlayer(inst), IntEnum<gamedataProficiencyType>(i)));
    i += 1;
  };
}

public static exec func PrintPerks(gi: GameInstance) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let PDS: ref<PlayerDevelopmentSystem> = GameInstance.GetScriptableSystemsContainer(gi).Get(n"PlayerDevelopmentSystem") as PlayerDevelopmentSystem;
  let perks: array<SPerk> = PDS.GetPerks(player);
  let i: Int32 = 0;
  while i < ArraySize(perks) {
    LogDM(" ========================== ");
    LogDM("Perk type: " + EnumValueToString("gamedataPerkType", Cast<Int64>(EnumInt(perks[i].type))));
    LogDM("Perk current level: " + perks[i].currLevel);
    LogDM("Perk max level: " + PDS.GetPerkMaxLevel(player, perks[i].type));
    i += 1;
  };
}

public static exec func PrintProfExpToNextLevel(inst: GameInstance, stringProfType: String) -> Void {
  let enumProfType: gamedataProficiencyType = IntEnum<gamedataProficiencyType>(Cast<Int32>(EnumValueFromString("gamedataProficiencyType", stringProfType)));
  let playerDevSystem: ref<PlayerDevelopmentSystem> = GameInstance.GetScriptableSystemsContainer(inst).Get(n"PlayerDevelopmentSystem") as PlayerDevelopmentSystem;
  let currentProfExp: Int32 = playerDevSystem.GetCurrentLevelProficiencyExp(GetPlayer(inst), enumProfType);
  let profExpToNextLevel: Int32 = playerDevSystem.GetRemainingExpForLevelUp(GetPlayer(inst), enumProfType);
  LogDM("Proficiency: " + stringProfType + " current level experience is - " + currentProfExp + ", experience to next level is - " + profExpToNextLevel);
}

public static exec func ModifyDifficulty(inst: GameInstance, stringDifficultyLevel: String) -> Void {
  let player: ref<GameObject> = GameInstance.GetPlayerSystem(inst).GetLocalPlayerMainGameObject();
  let statsSystem: ref<StatsSystem> = GameInstance.GetStatsSystem(inst);
  let statMod: ref<gameConstantStatModifierData> = new gameConstantStatModifierData();
  statMod.modifierType = gameStatModifierType.Additive;
  statMod.statType = gamedataStatType.PowerLevel;
  if Equals(stringDifficultyLevel, "Increase") {
    statMod.value = 0.50;
    statsSystem.AddModifier(Cast<StatsObjectID>(player.GetEntityID()), statMod);
  } else {
    if Equals(stringDifficultyLevel, "Decrease") {
      statMod.value = -0.50;
      statsSystem.AddModifier(Cast<StatsObjectID>(player.GetEntityID()), statMod);
    };
  };
}

public static exec func APE(gi: GameInstance, perk: String, level: String) -> Void {
  let data: array<wref<PerkLevelData_Record>>;
  let packageID: TweakDBID;
  let lvl: Int32 = StringToInt(level);
  TweakDBInterface.GetPerkRecord(TDBID.Create("Perks." + perk)).Levels(data);
  packageID = data[lvl - 1].DataPackage().GetID();
  GameInstance.GetGameplayLogicPackageSystem(gi).ApplyPackage(GetPlayer(gi), GetPlayer(gi), packageID);
}

public static exec func CGLP(gi: GameInstance) -> Void {
  let i: Int32;
  let packages: array<TweakDBID>;
  let glps: ref<GameplayLogicPackageSystem> = GameInstance.GetGameplayLogicPackageSystem(gi);
  glps.GetAppliedPackages(GetPlayer(gi), packages);
  i = 0;
  while i < ArraySize(packages) {
    glps.RemovePackage(GetPlayer(gi), packages[i]);
    i += 1;
  };
}

public static exec func Pvd(server: String) -> Void {
  PvdClientConnect(server);
}

public static exec func PvdDump(filePath: String) -> Void {
  PvdFileDumpConnect(filePath);
}

public static exec func DebugReward(gameInstance: GameInstance, rewardDef: String) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gameInstance);
  let tdbid: TweakDBID = TDBID.Create("QuestRewards." + rewardDef);
  let evt: ref<RewardEvent> = new RewardEvent();
  evt.rewardName = tdbid;
  player.QueueEvent(evt);
}

public static exec func LogPlayerPositionAndName(gameInstance: GameInstance) -> Void {
  let worldPosition: Vector4;
  let playerObject: ref<GameObject> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject();
  if IsDefined(playerObject) {
    worldPosition = playerObject.GetWorldPosition();
    Log("Player Position:: " + Vector4.ToString(worldPosition));
    Log("Player Name:: " + NameToString(playerObject.GetName()));
  };
}

public static exec func ParameterTest1(gameInstance: GameInstance, param1: String) -> Void {
  Log("param1:: " + param1);
}

public static exec func ParameterTest5(gameInstance: GameInstance, param1: String, param2: String, param3: String, param4: String, param5: String) -> Void {
  Log("param1:: " + param1);
  Log("param2:: " + param2);
  Log("param3:: " + param3);
  Log("param4:: " + param4);
  Log("param5:: " + param5);
}

public static exec func ToIntTest(gameInstance: GameInstance, toInt: String) -> Void {
  let fromString: Int32 = StringToInt(toInt);
  fromString += 100;
  Log(IntToString(fromString));
}

public static exec func SetZoneType(gameInstance: GameInstance, zoneType: String) -> Void {
  let intValue: Int32 = StringToInt(zoneType);
  SetFactValue(gameInstance, n"CityAreaType", intValue);
}

public static exec func SetQuestWeaponState(gameInstance: GameInstance, weaponState: String) -> Void {
  SetFactValue(gameInstance, n"ForceSafeState", 0);
  SetFactValue(gameInstance, n"ForceEmptyHands", 0);
  switch StringToInt(weaponState) {
    case 1:
      SetFactValue(gameInstance, n"ForceSafeState", 1);
      break;
    case 2:
      SetFactValue(gameInstance, n"ForceEmptyHands", 1);
      break;
    default:
  };
}

public static exec func RequestItem(gameInstance: GameInstance, itemTDBID: TweakDBID, slotID: TweakDBID) -> Void {
  let param: ref<parameterRequestItem>;
  let psmEvent: ref<PSMPostponedParameterScriptable>;
  let request: RequestItemParam;
  let playerObject: ref<GameObject> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject();
  if IsDefined(playerObject) {
    request.itemIDToEquip = ItemID.CreateQuery(itemTDBID);
    request.slotID = slotID;
    request.forceFirstEquip = true;
    param = new parameterRequestItem();
    ArrayPush(param.requests, request);
    psmEvent = new PSMPostponedParameterScriptable();
    psmEvent.value = param;
    psmEvent.id = n"requestItem";
    playerObject.QueueEvent(psmEvent);
  };
}

public static exec func ModifyPlayerStatPoolValue(gi: GameInstance, statPoolTypeString: String, value: String, opt percentage: String) -> Void {
  let isPercent: Bool;
  let player: ref<PlayerPuppet>;
  let playerID: StatsObjectID;
  let statPoolType: gamedataStatPoolType;
  let statPoolValue: Float;
  let statPoolTypeInt: Int32 = Cast<Int32>(EnumValueFromString("gamedataStatPoolType", statPoolTypeString));
  if statPoolTypeInt == -1 {
    LogWarning("ModifyPlayerStatPoolValue: provided stat pool type " + statPoolTypeString + " is not a stat pool!");
    return;
  };
  player = GetPlayer(gi);
  playerID = Cast<StatsObjectID>(player.GetEntityID());
  statPoolType = IntEnum<gamedataStatPoolType>(statPoolTypeInt);
  statPoolValue = StringToFloat(value);
  isPercent = StringToBool(percentage);
  if NotEquals(percentage, "") {
    GameInstance.GetStatPoolsSystem(gi).RequestSettingStatPoolValue(playerID, statPoolType, statPoolValue, null, isPercent);
  } else {
    GameInstance.GetStatPoolsSystem(gi).RequestSettingStatPoolValue(playerID, statPoolType, statPoolValue, null);
  };
}

public static exec func ModifyNPCStatPoolValue(gi: GameInstance, statPoolTypeString: String, value: String, opt percentage: String) -> Void {
  let gameEffectInstance: ref<EffectInstance>;
  let isPercent: Bool;
  let player: ref<PlayerPuppet>;
  let statPoolValue: Float;
  let statPool: Int32 = Cast<Int32>(EnumValueFromString("gamedataStatPoolType", statPoolTypeString));
  if statPool == -1 {
    LogWarning("ModifyNPCStatPoolValue: provided stat pool type " + statPoolTypeString + " is not a stat pool!");
    return;
  };
  player = GetPlayer(gi);
  statPoolValue = StringToFloat(value);
  if NotEquals(percentage, "") {
    isPercent = StringToBool(percentage);
  } else {
    isPercent = true;
  };
  gameEffectInstance = GameInstance.GetGameEffectSystem(gi).CreateEffectStatic(n"debugStrike", n"modStatPoolRay", GetPlayer(gi));
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, player.GetWorldPosition());
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.forward, player.GetWorldForward());
  EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.range, 50.00);
  EffectData.SetInt(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.statType, statPool);
  EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.value, statPoolValue);
  EffectData.SetBool(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.debugBool, isPercent);
  gameEffectInstance.Run();
}

public static exec func AddPlayerStatPoolBonus(gi: GameInstance, statPoolTypeString: String, bonusValueString: String, persistance: String, opt percentage: String) -> Void {
  let bonusValue: Float;
  let isPercent: Bool;
  let isPersistent: Bool;
  let playerID: StatsObjectID;
  let statPoolType: gamedataStatPoolType;
  let statPoolTypeInt: Int32 = Cast<Int32>(EnumValueFromString("gamedataStatPoolType", statPoolTypeString));
  if statPoolTypeInt == -1 {
    LogWarning("AddStatPoolBonus: provided stat pool type " + statPoolTypeString + " is not a stat pool!");
    return;
  };
  statPoolType = IntEnum<gamedataStatPoolType>(statPoolTypeInt);
  playerID = Cast<StatsObjectID>(GetPlayer(gi).GetEntityID());
  bonusValue = StringToFloat(bonusValueString);
  isPercent = StringToBool(percentage);
  isPersistent = StringToBool(persistance);
  if NotEquals(percentage, "") {
    GameInstance.GetStatPoolsSystem(gi).RequestSettingStatPoolBonus(playerID, statPoolType, bonusValue, null, isPersistent, isPercent);
  } else {
    GameInstance.GetStatPoolsSystem(gi).RequestSettingStatPoolBonus(playerID, statPoolType, bonusValue, null, isPersistent);
  };
}

public static exec func ApplyRegenData(gi: GameInstance, statPoolTypeString: String, rangeBeginString: String, rangeEndString: String, startDelayString: String, valuePerSecString: String, delayOnChangeString: String) -> Void {
  ApplyStatPoolModifier(gi, statPoolTypeString, StringToFloat(rangeBeginString), StringToFloat(rangeEndString), StringToFloat(startDelayString), StringToFloat(valuePerSecString), StringToBool(delayOnChangeString), gameStatPoolModificationTypes.Regeneration);
}

public static exec func ApplyRegenModifier(gi: GameInstance, statPoolTypeString: String, statPoolModName: String) -> Void {
  let statPoolMod: ref<PoolValueModifier_Record> = TweakDBInterface.GetPoolValueModifierRecord(TDBID.Create("BaseStatPools." + statPoolModName));
  ApplyStatPoolModifier(gi, statPoolTypeString, statPoolMod.RangeBegin(), statPoolMod.RangeEnd(), statPoolMod.StartDelay(), statPoolMod.ValuePerSec(), statPoolMod.DelayOnChange(), gameStatPoolModificationTypes.Regeneration);
}

public static exec func ApplyDecayData(gi: GameInstance, statPoolTypeString: String, rangeBeginString: String, rangeEndString: String, startDelayString: String, valuePerSecString: String, delayOnChangeString: String) -> Void {
  ApplyStatPoolModifier(gi, statPoolTypeString, StringToFloat(rangeBeginString), StringToFloat(rangeEndString), StringToFloat(startDelayString), StringToFloat(valuePerSecString), StringToBool(delayOnChangeString), gameStatPoolModificationTypes.Decay);
}

public static exec func ApplyDecayModifier(gi: GameInstance, statPoolTypeString: String, statPoolModName: String) -> Void {
  let statPoolMod: ref<PoolValueModifier_Record> = TweakDBInterface.GetPoolValueModifierRecord(TDBID.Create("BaseStatPools." + statPoolModName));
  ApplyStatPoolModifier(gi, statPoolTypeString, statPoolMod.RangeBegin(), statPoolMod.RangeEnd(), statPoolMod.StartDelay(), statPoolMod.ValuePerSec(), statPoolMod.DelayOnChange(), gameStatPoolModificationTypes.Decay);
}

public static func ApplyStatPoolModifier(gi: GameInstance, statPoolTypeString: String, rangeBegin: Float, rangeEnd: Float, startDelay: Float, valuePerSec: Float, delayOnChange: Bool, statPoolModType: gameStatPoolModificationTypes) -> Void {
  let playerID: StatsObjectID;
  let statPool: gamedataStatPoolType;
  let statPoolModifier: StatPoolModifier;
  let statPoolInt: Int32 = Cast<Int32>(EnumValueFromString("gamedataStatPoolType", statPoolTypeString));
  if statPoolInt == -1 {
    LogWarning("ApplyStatPoolModifier: provided stat pool type " + statPoolTypeString + " is not a stat pool!");
    return;
  };
  playerID = Cast<StatsObjectID>(GetPlayer(gi).GetEntityID());
  statPool = IntEnum<gamedataStatPoolType>(statPoolInt);
  statPoolModifier.enabled = true;
  statPoolModifier.rangeBegin = rangeBegin;
  statPoolModifier.rangeEnd = rangeEnd;
  statPoolModifier.startDelay = startDelay;
  statPoolModifier.valuePerSec = valuePerSec;
  statPoolModifier.delayOnChange = delayOnChange;
  GameInstance.GetStatPoolsSystem(gi).RequestSettingModifier(playerID, statPool, statPoolModType, statPoolModifier);
}

public static exec func SetDefaultRegen(gi: GameInstance, statPoolTypeString: String) -> Void {
  SetDefaultStatPoolModifiers(gi, statPoolTypeString, gameStatPoolModificationTypes.Regeneration);
}

public static exec func SetDefaultDecay(gi: GameInstance, statPoolTypeString: String) -> Void {
  SetDefaultStatPoolModifiers(gi, statPoolTypeString, gameStatPoolModificationTypes.Decay);
}

public static func SetDefaultStatPoolModifiers(gi: GameInstance, statPoolTypeString: String, statPoolModType: gameStatPoolModificationTypes) -> Void {
  let playerID: StatsObjectID;
  let statPool: gamedataStatPoolType;
  let statPoolInt: Int32 = Cast<Int32>(EnumValueFromString("gamedataStatPoolType", statPoolTypeString));
  if statPoolInt == -1 {
    LogWarning("SetDefault(Regen/Decay): provided stat pool type " + statPoolTypeString + " is not a stat pool!");
    return;
  };
  playerID = Cast<StatsObjectID>(GetPlayer(gi).GetEntityID());
  statPool = IntEnum<gamedataStatPoolType>(statPoolInt);
  GameInstance.GetStatPoolsSystem(gi).RequestResetingModifier(playerID, statPool, statPoolModType);
}

public static exec func DebugNPC(gi: GameInstance, opt durationStr: String) -> Void {
  let gameEffectInstance: ref<EffectInstance>;
  let infiniteDuration: Bool;
  let durationFloat: Float = StringToFloat(durationStr);
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  if durationFloat < 0.00 {
    GetPlayer(gi).DEBUG_Visualizer.ClearPuppetVisualization();
  } else {
    infiniteDuration = FloatIsEqual(durationFloat, 0.00);
    gameEffectInstance = GameInstance.GetGameEffectSystem(gi).CreateEffectStatic(n"debugStrike", n"vdb_ray", GetPlayer(gi));
    EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.duration, durationFloat);
    EffectData.SetBool(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.infiniteDuration, infiniteDuration);
    EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, player.GetWorldPosition());
    EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.forward, player.GetWorldForward());
    EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.range, 20.00);
    gameEffectInstance.Run();
  };
}

public static exec func DebugNPCs(gi: GameInstance, opt durationStr: String, opt radiusStr: String, opt moveWithPlayerStr: String) -> Void {
  DebugNPCs_NonExec(gi, durationStr, radiusStr, moveWithPlayerStr);
}

public static exec func DebugNPCs_NonExec(const gi: GameInstance, opt durationStr: String, opt radiusStr: String, opt moveWithPlayerStr: String) -> Void {
  let gameEffectInstance: ref<EffectInstance>;
  let infiniteDuration: Bool;
  let durationFloat: Float = StringToFloat(durationStr);
  let radius: Float = StringToFloat(radiusStr);
  let moveWithPlayer: Bool = StringToBool(moveWithPlayerStr);
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  if FloatIsEqual(radius, 0.00) {
    radius = 20.00;
  };
  if durationFloat < 0.00 {
    SetFactValue(gi, n"cheat_vdb_const", 0);
    GetPlayer(gi).DEBUG_Visualizer.ClearPuppetVisualization();
  } else {
    if moveWithPlayer {
      SetFactValue(gi, n"cheat_vdb_const", 1);
      gameEffectInstance = GameInstance.GetGameEffectSystem(gi).CreateEffectStatic(n"debugStrike", n"vdb_sphere_constant", GetPlayer(gi));
      EffectData.SetBool(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.infiniteDuration, true);
      EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, player.GetWorldPosition());
      EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.radius, radius);
      gameEffectInstance.Run();
    } else {
      infiniteDuration = FloatIsEqual(durationFloat, 0.00);
      gameEffectInstance = GameInstance.GetGameEffectSystem(gi).CreateEffectStatic(n"debugStrike", n"vdb_sphere", GetPlayer(gi));
      EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.duration, durationFloat);
      EffectData.SetBool(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.infiniteDuration, infiniteDuration);
      EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, player.GetWorldPosition());
      EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.radius, radius);
      gameEffectInstance.Run();
    };
  };
}

public static exec func PrintStatsPlayer(gi: GameInstance) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let gameEffectInstance: ref<EffectInstance> = GameInstance.GetGameEffectSystem(gi).CreateEffectStatic(n"debugStrike", n"printStatsPlayer", GetPlayer(gi));
  EffectData.SetEntity(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.entity, player);
  gameEffectInstance.Run();
}

public static exec func PrintStatsTarget(gi: GameInstance) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let gameEffectInstance: ref<EffectInstance> = GameInstance.GetGameEffectSystem(gi).CreateEffectStatic(n"debugStrike", n"printStatsRay", GetPlayer(gi));
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, player.GetWorldPosition());
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.forward, player.GetWorldForward());
  EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.range, 50.00);
  gameEffectInstance.Run();
}

public static exec func PrintStatTarget(gi: GameInstance, statType: String) -> Void {
  let gameEffectInstance: ref<EffectInstance>;
  let player: ref<PlayerPuppet>;
  let stat: Int32 = Cast<Int32>(EnumValueFromString("gamedataStatType", statType));
  if stat == -1 {
    LogWarning("PrintStatTarget: provided stat type " + statType + " is not a stat!");
    return;
  };
  player = GetPlayer(gi);
  gameEffectInstance = GameInstance.GetGameEffectSystem(gi).CreateEffectStatic(n"debugStrike", n"printStatRay", GetPlayer(gi));
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, player.GetWorldPosition());
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.forward, player.GetWorldForward());
  EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.range, 50.00);
  EffectData.SetInt(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.statType, stat);
  gameEffectInstance.Run();
}

public static exec func ModStatPlayer(gi: GameInstance, TEMP_stat: String, TEMP_val: String) -> Void {
  let stat: gamedataStatType = IntEnum<gamedataStatType>(Cast<Int32>(EnumValueFromString("gamedataStatType", TEMP_stat)));
  let val: Float = StringToFloat(TEMP_val);
  let hack: ref<StrikeExecutor_ModifyStat> = new StrikeExecutor_ModifyStat();
  hack.ModStatPuppet(GetPlayer(gi), stat, val, GetPlayer(gi));
}

public static exec func ModStatTarget(gi: GameInstance, TEMP_stat: String, TEMP_val: String) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let stat: Int32 = Cast<Int32>(EnumValueFromString("gamedataStatType", TEMP_stat));
  let val: Float = StringToFloat(TEMP_val);
  let gameEffectInstance: ref<EffectInstance> = GameInstance.GetGameEffectSystem(gi).CreateEffectStatic(n"stats", n"modStatRay", GetPlayer(gi));
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, player.GetWorldPosition());
  EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.forward, player.GetWorldForward());
  EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.range, 50.00);
  EffectData.SetInt(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.statType, stat);
  EffectData.SetFloat(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.value, val);
  gameEffectInstance.Run();
}

public static exec func PlayerSD(gameInstance: GameInstance) -> Void {
  PrintStatsDetails(gameInstance, GetPlayer(gameInstance));
}

public static exec func WeaponSD(gi: GameInstance) -> Void {
  let obj: ref<WeaponObject> = ScriptedPuppet.GetActiveWeapon(GetPlayer(gi));
  PrintStatsDetails(gi, obj);
}

public static exec func PrintStatsDetails(gameInstance: GameInstance, obj: ref<GameObject>) -> Void {
  let detailedList: array<gameStatDetailedData> = GameInstance.GetStatsSystem(gameInstance).GetStatDetails(Cast<StatsObjectID>(obj.GetEntityID()));
  let i: Int32 = 0;
  while i < ArraySize(detailedList) {
    PrintStatDetails(gameInstance, detailedList[i]);
    i += 1;
  };
  LogStats("__________________________END__________________________");
}

public static exec func PrintStatDetails(gameInstance: GameInstance, statDetails: gameStatDetailedData) -> Void {
  let boolValue: Bool;
  let j: Int32;
  let modifierType: String;
  let statModifierDetails: gameStatModifierDetailedData;
  LogStats("Stat: " + statDetails.statType);
  LogStats("IsBool: " + statDetails.boolStatType);
  if statDetails.boolStatType {
    if statDetails.value > 0.00 {
      boolValue = true;
    };
    LogStats("        Value: " + boolValue);
  } else {
    LogStats("        Value: " + statDetails.value);
  };
  LogStats("        Limits: " + NoTrailZeros(FloatToString(statDetails.limitMin)) + " - " + NoTrailZeros(FloatToString(statDetails.limitMax)));
  if ArraySize(statDetails.modifiers) > 0 {
    LogStats("        Modifiers:");
    j = 0;
    while j < ArraySize(statDetails.modifiers) {
      statModifierDetails = statDetails.modifiers[j];
      modifierType = ModifierTypeToString(statModifierDetails.modifierType);
      LogStats("                {");
      LogStats("                    Type: " + modifierType);
      LogStats("                    Value: " + NoTrailZeros(FloatToString(statModifierDetails.value)));
      LogStats("                }");
      j += 1;
    };
  };
  LogStats("--------");
}

public static exec func ModifierTypeToString(type: gameStatModifierType) -> String {
  let modifierType: String;
  if EnumInt(type) == 0 {
    modifierType = "Additive";
  } else {
    if EnumInt(type) == 1 {
      modifierType = "AdditiveMultiplier";
    } else {
      if EnumInt(type) == 2 {
        modifierType = "Multiplier";
      } else {
        modifierType = "Invalid";
      };
    };
  };
  return modifierType;
}

public static exec func PrintGodModeSources(gameInstance: GameInstance) -> Void {
  let i: Int32;
  let immortalCount: Int32;
  let immortalSources: array<CName>;
  let invulnerableCount: Int32;
  let invulnerableSources: array<CName>;
  let godModeSystem: ref<GodModeSystem> = GameInstance.GetGodModeSystem(gameInstance);
  let player: ref<PlayerPuppet> = GetPlayer(gameInstance);
  let playerID: EntityID = player.GetEntityID();
  LogStats("Printing God Modes:");
  invulnerableCount = Cast<Int32>(godModeSystem.GetGodModeCount(playerID, gameGodModeType.Invulnerable));
  if invulnerableCount > 0 {
    LogStats("Invulnerable: " + IntToString(invulnerableCount));
    invulnerableSources = godModeSystem.GetGodModeSources(playerID, gameGodModeType.Invulnerable);
    i = 0;
    while i < invulnerableCount {
      LogStats("    " + NameToString(invulnerableSources[i]));
      i += 1;
    };
  };
  immortalCount = Cast<Int32>(godModeSystem.GetGodModeCount(playerID, gameGodModeType.Immortal));
  if immortalCount > 0 {
    LogStats("Immortal: " + IntToString(immortalCount));
    immortalSources = godModeSystem.GetGodModeSources(playerID, gameGodModeType.Immortal);
    i = 0;
    while i < immortalCount {
      LogStats("    " + NameToString(immortalSources[i]));
      i += 1;
    };
  };
  if invulnerableCount == 0 && immortalCount == 0 {
    LogStats("    No god modes");
  };
  LogStats("------");
}

public static exec func TEST_TargetImmortal(gameInstance: GameInstance, shouldSetStr: String) -> Void {
  let angleDist: EulerAngles;
  let shouldSet: Bool = StringToBool(shouldSetStr);
  let target: ref<GameObject> = GameInstance.GetTargetingSystem(gameInstance).GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
  let targetID: EntityID = target.GetEntityID();
  if IsDefined(target) {
    if shouldSet {
      GameInstance.GetGodModeSystem(gameInstance).AddGodMode(targetID, gameGodModeType.Immortal, n"TEST_TargetImmortal");
    } else {
      GameInstance.GetGodModeSystem(gameInstance).RemoveGodMode(targetID, gameGodModeType.Immortal, n"TEST_TargetImmortal");
    };
  };
}

public static exec func TEST_TargetInvulnerable(gameInstance: GameInstance, shouldSetStr: String) -> Void {
  let angleDist: EulerAngles;
  let shouldSet: Bool = StringToBool(shouldSetStr);
  let target: ref<GameObject> = GameInstance.GetTargetingSystem(gameInstance).GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL());
  let targetID: EntityID = target.GetEntityID();
  if IsDefined(target) {
    if shouldSet {
      GameInstance.GetGodModeSystem(gameInstance).AddGodMode(targetID, gameGodModeType.Invulnerable, n"TEST_TargetInvulnerable");
    } else {
      GameInstance.GetGodModeSystem(gameInstance).RemoveGodMode(targetID, gameGodModeType.Invulnerable, n"TEST_TargetInvulnerable");
    };
  };
}

public static exec func Debug_WeaponSpread_Set(gameInstance: GameInstance, useCircularDistribution: Bool, useEvenDistribution: Bool, rowCount: Int32, projectilesPerShot: Int32) -> Void {
  let bbSystem: ref<BlackboardSystem> = GameInstance.GetBlackboardSystem(gameInstance);
  let debugBB: ref<IBlackboard> = bbSystem.Get(GetAllBlackboardDefs().DebugData);
  debugBB.SetBool(GetAllBlackboardDefs().DebugData.WeaponSpread_UseEvenDistribution, useEvenDistribution);
  debugBB.SetBool(GetAllBlackboardDefs().DebugData.WeaponSpread_UseCircularSpread, useCircularDistribution);
  debugBB.SetInt(GetAllBlackboardDefs().DebugData.WeaponSpread_EvenDistributionRowCount, rowCount);
  debugBB.SetInt(GetAllBlackboardDefs().DebugData.WeaponSpread_ProjectilesPerShot, projectilesPerShot);
}

public static exec func Debug_WeaponSpread(gameInstance: GameInstance, useCircularDistribution: String, useEvenDistribution: String, rowCount: String, projectilesPerShot: String) -> Void {
  let _projectilesPerShot: Int32;
  let _rowCount: Int32;
  let _useCircularDistribution: Bool;
  let _useEvenDistribution: Bool;
  if Equals(useEvenDistribution, "true") {
    _useEvenDistribution = true;
  };
  if Equals(useEvenDistribution, "false") {
    _useEvenDistribution = false;
  };
  if Equals(useCircularDistribution, "true") {
    _useCircularDistribution = true;
  };
  if Equals(useCircularDistribution, "false") {
    _useCircularDistribution = false;
  };
  _rowCount = StringToInt(rowCount, 1);
  _projectilesPerShot = StringToInt(projectilesPerShot, 1);
  Debug_WeaponSpread_Set(gameInstance, _useCircularDistribution, _useEvenDistribution, _rowCount, _projectilesPerShot);
}

public static exec func Debug_WeaponSpread_RandomGrid(gameInstance: GameInstance) -> Void {
  Debug_WeaponSpread_Set(gameInstance, false, true, RandRange(1, 10), RandRange(1, 40));
}

public static exec func Debug_WeaponSpread_RandomCircular(gameInstance: GameInstance) -> Void {
  Debug_WeaponSpread_Set(gameInstance, true, true, RandRange(1, 10), RandRange(1, 40));
}

public static exec func PrintPlayerStat(gi: GameInstance, TEMP_Type: String) -> Void {
  let stat: gamedataStatType = IntEnum<gamedataStatType>(Cast<Int32>(EnumValueFromString("gamedataStatType", TEMP_Type)));
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let playerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
  let statValue: Float = GameInstance.GetStatsSystem(gi).GetStatValue(playerID, stat);
  LogStats("Stat: " + TEMP_Type + " Value: " + statValue);
}

public static exec func PrintPlayerStats(gi: GameInstance) -> Void {
  let playerStat: gamedataStatType;
  let statValue: Float;
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let playerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
  let i: Int32 = 0;
  while i < EnumInt(gamedataStatType.Count) {
    playerStat = IntEnum<gamedataStatType>(i);
    statValue = GameInstance.GetStatsSystem(gi).GetStatValue(playerID, playerStat);
    if statValue != 0.00 {
      LogStats("Stat: " + EnumValueToString("gamedataStatType", Cast<Int64>(i)) + " Value: " + statValue);
    };
    i += 1;
  };
}

public static exec func PrintTargetStats(gi: GameInstance) -> Void {
  let statValue: Float;
  let target: ref<GameObject> = GameInstance.GetTargetingSystem(gi).GetLookAtObject(GetPlayer(gi));
  let i: Int32 = 0;
  while i < EnumInt(gamedataStatType.Count) {
    statValue = GameInstance.GetStatsSystem(gi).GetStatValue(Cast<StatsObjectID>(target.GetEntityID()), IntEnum<gamedataStatType>(i));
    if statValue != 0.00 {
      LogStats("Stat: " + EnumValueToString("gamedataStatType", Cast<Int64>(i)) + " Value: " + statValue);
    };
    i += 1;
  };
}

public static exec func PrintPlayerStatModifiers(gi: GameInstance, type: String) -> Void {
  let i: Int32;
  let playerID: StatsObjectID;
  let statDetails: array<gameStatDetailedData>;
  let statMods: array<gameStatModifierDetailedData>;
  let statSystem: ref<StatsSystem>;
  let statType: gamedataStatType;
  let statVal: Float;
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  if !IsDefined(player) {
    return;
  };
  playerID = Cast<StatsObjectID>(player.GetEntityID());
  statSystem = GameInstance.GetStatsSystem(gi);
  statType = IntEnum<gamedataStatType>(Cast<Int32>(EnumValueFromString("gamedataStatType", type)));
  statDetails = statSystem.GetStatDetails(playerID);
  i = 0;
  while i < ArraySize(statDetails) {
    if Equals(statDetails[i].statType, statType) {
      statVal = statDetails[i].value;
      statMods = statDetails[i].modifiers;
      break;
    };
    i += 1;
  };
  if ArraySize(statMods) != 0 {
    LogStats("================================");
    LogStats("========= STAT: " + type + " =========");
    LogStats("========= Value: " + FloatToString(statVal) + " ==========");
    LogStats("================================");
    LogStats("Modifiers: ");
  };
  i = 0;
  while i < ArraySize(statMods) {
    LogStats("Mod #" + IntToString(i) + " ; Value: " + FloatToString(statMods[i].value));
    i += 1;
  };
}

public static exec func AddStatModifier(gi: GameInstance, type: String, value: String, modType: String) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let playerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
  let statSystem: ref<StatsSystem> = GameInstance.GetStatsSystem(gi);
  let statType: gamedataStatType = IntEnum<gamedataStatType>(Cast<Int32>(EnumValueFromString("gamedataStatType", type)));
  let statModType: gameStatModifierType = IntEnum<gameStatModifierType>(Cast<Int32>(EnumValueFromString("gameStatModifierType", modType)));
  let statVal: Float = StringToFloat(value);
  statSystem.AddModifier(playerID, RPGManager.CreateStatModifier(statType, statModType, statVal));
}

public static exec func ApplyEffectOnPlayer(gi: GameInstance, effect: String) -> Void {
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let seID: TweakDBID = TDBID.Create(effect);
  GameInstance.GetStatusEffectSystem(gi).ApplyStatusEffect(player.GetEntityID(), seID, player.GetRecordID(), player.GetEntityID());
}

public static exec func ApplyEffectStackOnPlayer(gi: GameInstance, effect: String, count: String) -> Void {
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let seID: TweakDBID = TDBID.Create(effect);
  let countInt: Int32 = StringToInt(count);
  GameInstance.GetStatusEffectSystem(gi).ApplyStatusEffect(player.GetEntityID(), seID, player.GetRecordID(), player.GetEntityID(), Cast<Uint32>(countInt));
}

public static exec func RemoveEffectPlayer(gi: GameInstance, effect: String) -> Void {
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let seID: TweakDBID = TDBID.Create(effect);
  GameInstance.GetStatusEffectSystem(gi).RemoveStatusEffect(player.GetEntityID(), seID);
}

public static exec func PrintEffectsOnPlayer(gi: GameInstance) -> Void {
  let effectString: String;
  let effects: array<ref<StatusEffect>>;
  let i: Int32;
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  GameInstance.GetStatusEffectSystem(gi).GetAppliedEffects(player.GetEntityID(), effects);
  Log("Status effects currently on Player:");
  i = 0;
  while i < ArraySize(effects) {
    effectString = TDBID.ToStringDEBUG(effects[i].GetRecord().GetID());
    Log(effectString);
    i += 1;
  };
}

public static exec func PrintEffectsOnNPC(gi: GameInstance) -> Void {
  let effectString: String;
  let effects: array<ref<StatusEffect>>;
  let i: Int32;
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  GameInstance.GetStatusEffectSystem(gi).GetAppliedEffects(GameInstance.GetTargetingSystem(gi).GetLookAtObject(player).GetEntityID(), effects);
  Log("Status effects currently on an NPC:");
  i = 0;
  while i < ArraySize(effects) {
    effectString = TDBID.ToStringDEBUG(effects[i].GetRecord().GetID());
    Log(effectString);
    i += 1;
  };
}

public static exec func ApplyEffectOnNPC(gi: GameInstance, effect: String) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let seID: TweakDBID = TDBID.Create(effect);
  GameInstance.GetStatusEffectSystem(gi).ApplyStatusEffect(GameInstance.GetTargetingSystem(gi).GetLookAtObject(player).GetEntityID(), seID, player.GetRecordID(), player.GetEntityID());
}

public static exec func RagdollNPC(gi: GameInstance, pushForce: String) -> Void {
  let distance: Float;
  let playerCamFwd: Vector4;
  let playerCamPos: Vector4;
  let pulseOrigin: Vector4;
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let target: ref<NPCPuppet> = GameInstance.GetTargetingSystem(gi).GetLookAtObject(player) as NPCPuppet;
  if IsDefined(target) {
    target.QueueEvent(CreateForceRagdollEvent(n"Debug Command"));
    if NotEquals(pushForce, "") {
      distance = Vector4.Distance(target.GetWorldPosition(), player.GetWorldPosition());
      playerCamPos = Matrix.GetTranslation(player.GetFPPCameraComponent().GetLocalToWorld());
      playerCamFwd = Matrix.GetDirectionVector(player.GetFPPCameraComponent().GetLocalToWorld());
      pulseOrigin = playerCamPos + Vector4.Normalize(playerCamFwd) * distance * 0.85;
      GameInstance.GetDelaySystem(player.GetGame()).DelayEvent(target, CreateRagdollApplyImpulseEvent(pulseOrigin, Vector4.Normalize(playerCamFwd) * StringToFloat(pushForce), 5.00), 0.10, false);
      GameInstance.GetDebugVisualizerSystem(player.GetGame()).DrawWireSphere(pulseOrigin, 0.30, new Color(Cast<Uint8>(255u), Cast<Uint8>(0u), Cast<Uint8>(0u), Cast<Uint8>(255u)), 3.00);
      GameInstance.GetDebugVisualizerSystem(player.GetGame()).DrawLine3D(pulseOrigin, pulseOrigin + Vector4.Normalize(playerCamFwd) * StringToFloat(pushForce), new Color(Cast<Uint8>(0u), Cast<Uint8>(0u), Cast<Uint8>(255u), Cast<Uint8>(255u)), 3.00);
    };
  };
}

public static exec func SwapPreset(gameInstance: GameInstance, mappingName: String) -> Void {
  let swap: ref<SwapPresetEvent> = new SwapPresetEvent();
  swap.mappingName = mappingName;
  let localPlayer: ref<GameObject> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject();
  GameInstance.GetTargetingSystem(gameInstance).GetLookAtObject(localPlayer).QueueEvent(swap);
}

public static exec func EnableVehicleToggleSummonMode(gameInstance: GameInstance, value: String) -> Void {
  let intValue: Int32 = StringToInt(value);
  let blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(gameInstance).Get(GetAllBlackboardDefs().GameplaySettings);
  if intValue == 1 {
    blackboard.SetBool(GetAllBlackboardDefs().GameplaySettings.EnableVehicleToggleSummonMode, true);
  } else {
    blackboard.SetBool(GetAllBlackboardDefs().GameplaySettings.EnableVehicleToggleSummonMode, false);
  };
}

public static exec func CreateDebugStimuli(gameInstance: GameInstance, stimType: String, activeStim: String) -> Void {
  let broadcaster: ref<StimBroadcasterComponent>;
  let debugStim: gamedataStimType;
  let player: ref<PlayerPuppet>;
  StimBroadcasterComponent.nameToStimEnum(StringToName(stimType), debugStim);
  player = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;
  broadcaster = player.GetStimBroadcasterComponent();
  if IsDefined(broadcaster) {
    if Equals(activeStim, "true") {
      broadcaster.AddActiveStimuli(player, debugStim, 15.00);
    } else {
      broadcaster.TriggerSingleBroadcast(player, debugStim);
    };
  };
}

public static exec func pindatatest(instance: GameInstance) -> Void {
  let mappinData: MappinData;
  let scriptData: ref<TestMappinScriptData> = new TestMappinScriptData();
  scriptData.test = 5;
  mappinData.scriptData = scriptData;
  let otherScriptData: ref<TestMappinScriptData> = mappinData.scriptData as TestMappinScriptData;
  Log("test " + otherScriptData.test);
}

public static exec func ForceOutline(gameInstance: GameInstance, color: String, opacity: String) -> Void {
  let distance: EulerAngles;
  let dbgOutlineEvent: ref<DebugOutlineEvent> = new DebugOutlineEvent();
  let opacityValue: Float = StringToFloat(opacity);
  let targetSystem: ref<TargetingSystem> = GameInstance.GetTargetingSystem(gameInstance);
  let localPlayerObject: ref<GameObject> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject();
  let target: ref<GameObject> = targetSystem.GetObjectClosestToCrosshair(localPlayerObject, distance, TSQ_NPC());
  if Equals(StrLower(color), "green") {
    dbgOutlineEvent.type = EOutlineType.GREEN;
  } else {
    if Equals(StrLower(color), "red") {
      dbgOutlineEvent.type = EOutlineType.RED;
    } else {
      if Equals(StrLower(color), "none") || Equals(StrLower(color), "false") {
        dbgOutlineEvent.type = EOutlineType.NONE;
      };
    };
  };
  dbgOutlineEvent.opacity = opacityValue;
  dbgOutlineEvent.requester = localPlayerObject.GetEntityID();
  dbgOutlineEvent.duration = 2.00;
  target.QueueEvent(dbgOutlineEvent);
}

public static exec func PlayRumble(gameInstance: GameInstance, presetName: String) -> Void {
  let rumbleName: CName = TDB.GetCName(TDBID.Create("rumble.local." + presetName));
  GameObject.PlaySound(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet, rumbleName);
}
public static exec func SpawnTestEffect(gameInstance: GameInstance) -> Void {
  let pos: Vector4;
  pos.X = 0.00;
  pos.Y = 0.00;
  pos.Z = 0.00;
  let effect: ref<EffectInstance> = GameInstance.GetGameEffectSystem(gameInstance).CreateEffectStatic(n"test_effect", n"explosion", GetPlayer(gameInstance));
  EffectData.SetVector(effect.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, pos);
  effect.Run();
}

public static exec func EffectorOn(gi: GameInstance, record: String) -> Void {
  let tdbid: TweakDBID = TDBID.Create(record);
  if TDBID.IsValid(tdbid) {
    GameInstance.GetEffectorSystem(gi).ApplyEffector(GetPlayer(gi).GetEntityID(), GetPlayer(gi), tdbid);
  };
}

public static exec func EffectorOnW(gi: GameInstance, record: String) -> Void {
  let player: ref<PlayerPuppet>;
  let wpn: wref<WeaponObject>;
  let tdbid: TweakDBID = TDBID.Create(record);
  if TDBID.IsValid(tdbid) {
    player = GetPlayer(gi);
    wpn = ScriptedPuppet.GetActiveWeapon(player);
    GameInstance.GetEffectorSystem(gi).ApplyEffector(wpn.GetEntityID(), wpn, tdbid);
  };
}

public static exec func EffectorOff(gi: GameInstance, record: String) -> Void {
  GameInstance.GetEffectorSystem(gi).RemoveEffector(GetPlayer(gi).GetEntityID(), TDBID.Create(record));
}

public static exec func CLS_on(gameInstance: GameInstance) -> Void {
  let request: ref<ForceCLSStateRequest>;
  let system: ref<CityLightSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"CityLightSystem") as CityLightSystem;
  if IsDefined(system) {
    request = new ForceCLSStateRequest();
    request.state = ECLSForcedState.ForcedON;
    request.sourceName = n"DEBUG";
    request.priority = EPriority.Absolute;
    request.removePreviousRequests = true;
    system.QueueRequest(request);
  };
}

public static exec func CLS_off(gameInstance: GameInstance) -> Void {
  let request: ref<ForceCLSStateRequest>;
  let system: ref<CityLightSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"CityLightSystem") as CityLightSystem;
  if IsDefined(system) {
    request = new ForceCLSStateRequest();
    request.state = ECLSForcedState.ForcedOFF;
    request.sourceName = n"DEBUG";
    request.priority = EPriority.Absolute;
    request.removePreviousRequests = true;
    system.QueueRequest(request);
  };
}

public static exec func CLS_reset(gameInstance: GameInstance) -> Void {
  let request: ref<ForceCLSStateRequest>;
  let system: ref<CityLightSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"CityLightSystem") as CityLightSystem;
  if IsDefined(system) {
    request = new ForceCLSStateRequest();
    request.state = ECLSForcedState.DEFAULT;
    request.sourceName = n"DEBUG";
    request.priority = EPriority.Absolute;
    request.removePreviousRequests = true;
    system.QueueRequest(request);
  };
}

public static exec func IncreaseGlobalTimeDilation(gi: GameInstance) -> Void {
  let cheatSystem: ref<DebugCheatsSystem> = GameInstance.GetDebugCheatsSystem(gi);
  cheatSystem.IncreaseGlobalTimeDilation();
}

public static exec func DecreaseGlobalTimeDilation(gi: GameInstance) -> Void {
  let cheatSystem: ref<DebugCheatsSystem> = GameInstance.GetDebugCheatsSystem(gi);
  cheatSystem.DecreaseGlobalTimeDilation();
}

public static exec func IncreasePlayerTimeDilation(gi: GameInstance) -> Void {
  let cheatSystem: ref<DebugCheatsSystem> = GameInstance.GetDebugCheatsSystem(gi);
  cheatSystem.IncreasePlayerTimeDilation();
}

public static exec func DecreasePlayerTimeDilation(gi: GameInstance) -> Void {
  let cheatSystem: ref<DebugCheatsSystem> = GameInstance.GetDebugCheatsSystem(gi);
  cheatSystem.DecreasePlayerTimeDilation();
}

public static exec func TestDrop(gameInstance: GameInstance) -> Void {
  let itemID: ItemID;
  let request: ref<DropPointRequest>;
  let player: ref<GameObject> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject();
  let ts: ref<TransactionSystem> = GameInstance.GetTransactionSystem(gameInstance);
  let dps: ref<DropPointSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"DropPointSystem") as DropPointSystem;
  if !IsDefined(ts) {
    return;
  };
  itemID = ItemID.FromTDBID(t"Items.w_special_flak");
  ts.GiveItem(player, itemID, 1);
  request = new DropPointRequest();
  request.CreateRequest(ItemID.GetTDBID(itemID), DropPointPackageStatus.ACTIVE);
  dps.QueueRequest(request);
}

public static exec func FastTravel_f(gameInstance: GameInstance, magicFloat: String) -> Void {
  let request: ref<FastTravelConsoleInstructionRequest>;
  let system: ref<FastTravelSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"FastTravelSystem") as FastTravelSystem;
  if IsDefined(system) {
    request = new FastTravelConsoleInstructionRequest();
    request.instruction = EFastTravelSystemInstruction.Forward;
    request.magicFloat = StringToFloat(magicFloat);
    system.QueueRequest(request);
  };
}

public static exec func trackPrev(instance: GameInstance) -> Void {
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  journal.TrackPrevNextEntry(false);
}

public static exec func trackNext(instance: GameInstance) -> Void {
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  journal.TrackPrevNextEntry(true);
}

public static exec func untrack(instance: GameInstance) -> Void {
  let dummy: wref<JournalEntry>;
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  journal.TrackEntry(dummy);
}

public static exec func printTracked(instance: GameInstance) -> Void {
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  let entry: wref<JournalEntry> = journal.GetTrackedEntry();
  if IsDefined(entry) {
    Log("Tracked entry [" + entry.GetId() + "] [" + entry.GetEditorName() + "]");
  } else {
    Log("No tracked entry");
  };
}

public static exec func printJ(instance: GameInstance) -> Void {
  let context: JournalRequestContext;
  let descriptionAndMappinEntries: array<wref<JournalEntry>>;
  let descriptionEntry: wref<JournalQuestDescription>;
  let i: Int32;
  let j: Int32;
  let k: Int32;
  let l: Int32;
  let m: Int32;
  let mappinEntry: wref<JournalQuestMapPin>;
  let objectiveEntries: array<wref<JournalEntry>>;
  let objectiveEntry: wref<JournalQuestObjective>;
  let phaseEntries: array<wref<JournalEntry>>;
  let phaseEntry: wref<JournalQuestPhase>;
  let questEntries: array<wref<JournalEntry>>;
  let questEntry: wref<JournalQuest>;
  let subobjectiveDescriptionAndMappinEntries: array<wref<JournalEntry>>;
  let subobjectiveEntry: wref<JournalQuestSubObjective>;
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  Log("=========================================================================================");
  context.stateFilter.active = true;
  context.stateFilter.succeeded = true;
  journal.GetQuests(context, questEntries);
  i = 0;
  while i < ArraySize(questEntries) {
    questEntry = questEntries[i] as JournalQuest;
    if !IsDefined(questEntry) {
      Log("Q" + i + " ???");
    } else {
      Log("Q" + i + " [" + EnumInt(journal.GetEntryState(questEntry)) + "] [" + questEntry.GetId() + "] [" + questEntry.GetEditorName() + "] [" + questEntry.GetTitle(journal) + "] " + " [" + EnumInt(questEntry.GetType()) + "]");
      journal.GetChildren(questEntry, context.stateFilter, phaseEntries);
      j = 0;
      while j < ArraySize(phaseEntries) {
        phaseEntry = phaseEntries[j] as JournalQuestPhase;
        if !IsDefined(phaseEntry) {
          Log("    P" + j + " ???");
        } else {
          Log("    P" + j + " [" + EnumInt(journal.GetEntryState(phaseEntry)) + "] [" + phaseEntry.GetId() + "] [" + phaseEntry.GetEditorName() + "]");
          journal.GetChildren(phaseEntry, context.stateFilter, objectiveEntries);
          k = 0;
          while k < ArraySize(objectiveEntries) {
            objectiveEntry = objectiveEntries[k] as JournalQuestObjective;
            if !IsDefined(objectiveEntry) {
              Log("        O" + k + " ???");
            } else {
              Log("        O" + k + " [" + EnumInt(journal.GetEntryState(objectiveEntry)) + "] [" + objectiveEntry.GetId() + "] [" + objectiveEntry.GetEditorName() + "]");
              Log("        DISTANCE " + journal.GetDistanceToNearestMappin(objectiveEntry));
              journal.GetChildren(objectiveEntry, context.stateFilter, subobjectiveDescriptionAndMappinEntries);
              l = 0;
              while l < ArraySize(subobjectiveDescriptionAndMappinEntries) {
                subobjectiveEntry = subobjectiveDescriptionAndMappinEntries[l] as JournalQuestSubObjective;
                mappinEntry = subobjectiveDescriptionAndMappinEntries[l] as JournalQuestMapPin;
                descriptionEntry = subobjectiveDescriptionAndMappinEntries[l] as JournalQuestDescription;
                if IsDefined(subobjectiveEntry) {
                  Log("            S" + l + " [" + EnumInt(journal.GetEntryState(subobjectiveEntry)) + "] [" + subobjectiveEntry.GetId() + "] [" + subobjectiveEntry.GetEditorName() + "]");
                  journal.GetChildren(subobjectiveEntry, context.stateFilter, descriptionAndMappinEntries);
                  m = 0;
                  while m < ArraySize(descriptionAndMappinEntries) {
                    mappinEntry = descriptionAndMappinEntries[m] as JournalQuestMapPin;
                    descriptionEntry = descriptionAndMappinEntries[m] as JournalQuestDescription;
                    if IsDefined(mappinEntry) {
                      Log("                M" + m + " [" + EnumInt(journal.GetEntryState(mappinEntry)) + "] [" + mappinEntry.GetId() + "] [" + mappinEntry.GetEditorName() + "]");
                    } else {
                      if IsDefined(descriptionEntry) {
                        Log("                D" + m + " [" + EnumInt(journal.GetEntryState(descriptionEntry)) + "] [" + descriptionEntry.GetId() + "] [" + descriptionEntry.GetEditorName() + "]");
                      } else {
                        Log("                MD " + m + " ???");
                      };
                    };
                    m += 1;
                  };
                } else {
                  if IsDefined(mappinEntry) {
                    Log("            M" + l + " [" + EnumInt(journal.GetEntryState(mappinEntry)) + "] [" + mappinEntry.GetId() + "] [" + mappinEntry.GetEditorName() + "]");
                  } else {
                    if IsDefined(descriptionEntry) {
                      Log("            D" + l + " [" + EnumInt(journal.GetEntryState(descriptionEntry)) + "] [" + descriptionEntry.GetId() + "] [" + descriptionEntry.GetEditorName() + "]");
                    } else {
                      Log("            SMD " + l + " ???");
                    };
                  };
                };
                l += 1;
              };
            };
            k += 1;
          };
        };
        j += 1;
      };
    };
    i += 1;
  };
}

public static exec func printJ2(instance: GameInstance) -> Void {
  let context: JournalRequestContext;
  let i: Int32;
  let journal: ref<JournalManager>;
  let questEntries: array<wref<JournalEntry>>;
  let questEntry: wref<JournalQuest>;
  context.stateFilter.inactive = true;
  context.stateFilter.active = true;
  context.stateFilter.failed = true;
  context.stateFilter.succeeded = true;
  JournalRequestContext.CreateQuestDistanceRequestFilter(context, instance, 50.00);
  journal = GameInstance.GetJournalManager(instance);
  journal.GetQuests(context, questEntries);
  Log(">>>>>>>>>>>>>>>>>> Q");
  i = 0;
  while i < ArraySize(questEntries) {
    questEntry = questEntries[i] as JournalQuest;
    Log("Q" + i + " [" + EnumInt(journal.GetEntryState(questEntry)) + "] [" + questEntry.GetId() + "] [" + questEntry.GetEditorName() + "] [" + questEntry.GetTitle(journal) + "] " + " [" + EnumInt(questEntry.GetType()) + "]");
    i += 1;
  };
  Log("<<<<<<<<<<<<<<<<<< Q");
}

public static exec func cset(instance: GameInstance) -> Void {
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  journal.ChangeEntryState("points_of_interest/minor_activities/ma_bls_ina_se1_09", "gameJournalPointOfInterestMappin", gameJournalEntryState.Active, JournalNotifyOption.Notify);
}

public static exec func gebs(instance: GameInstance) -> Void {
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  let entry: wref<JournalEntry> = journal.GetEntryByString("points_of_interest/minor_activities/ma_bls_ina_se1_09", "gameJournalPointOfInterestMappin");
  if entry != null {
    Log("Entry exists: " + entry.GetEditorName());
  } else {
    Log("Entry does not exist");
  };
}

public static exec func tconv(instance: GameInstance) -> Void {
  let conversations: array<wref<JournalEntry>>;
  let flattenedMessages: array<wref<JournalEntry>>;
  let flattenedReplies: array<wref<JournalEntry>>;
  let i: Int32;
  let messages: array<wref<JournalEntry>>;
  let replies: array<wref<JournalEntry>>;
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  let contact: wref<JournalEntry> = journal.GetEntryByString("contacts/administration", "gameJournalContact");
  if contact == null {
    Log("contact null");
    return;
  };
  journal.GetFlattenedMessagesAndChoices(contact, flattenedMessages, flattenedReplies);
  journal.GetConversations(contact, conversations);
  i = 0;
  while i < ArraySize(conversations) {
    journal.GetMessagesAndChoices(conversations[i], messages, replies);
    Log("test");
    i += 1;
  };
  Log("contact");
}

public static exec func tmq(instance: GameInstance) -> Void {
  let journal: ref<JournalManager> = GameInstance.GetJournalManager(instance);
  let data: JournalMetaQuestScriptedData = journal.GetMetaQuestData(gamedataMetaQuest.MetaQuest1);
  Log(">>>>> " + data.hidden + " " + Cast<Bool>(data.percent) + " " + data.text);
  data = journal.GetMetaQuestData(gamedataMetaQuest.MetaQuest2);
  Log(">>>>> " + data.hidden + " " + Cast<Bool>(data.percent) + " " + data.text);
  data = journal.GetMetaQuestData(gamedataMetaQuest.MetaQuest3);
  Log(">>>>> " + data.hidden + " " + Cast<Bool>(data.percent) + " " + data.text);
}

public static exec func SpawnLoot(gameInstance: GameInstance, loot: String) -> Void {
  let player: ref<GameObject> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject();
  GameInstance.GetLootManager(gameInstance).SpawnItemDrop(player, ItemID.FromTDBID(TDBID.Create(loot)), player.GetWorldPosition() + new Vector4(1.00, 1.00, 1.00, 0.00));
}

public static exec func testLocationUpdate(gameInstance: GameInstance, value: String) -> Void {
  GameInstance.GetMappinSystem(gameInstance).UpdateCurrentLocationName(value, true);
}

public static exec func TestNavigationSystem(gameInstance: GameInstance) -> Void {
  let end: Vector4;
  let fw: ref<NavigationFindWallResult>;
  let start: Vector4;
  start.X = 0.00;
  start.Y = 0.00;
  start.Z = 0.00;
  end.X = 20.00;
  end.Y = 20.00;
  end.Z = 0.00;
  let path: ref<NavigationPath> = GameInstance.GetNavigationSystem(gameInstance).CalculatePathOnlyHumanNavmesh(start, end, NavGenAgentSize.Human, 1.00);
  Log(ToString(path.path[0]));
  Log(ToString(path.path[1]));
  Log(ToString(path.CalculateLength()));
  fw = GameInstance.GetNavigationSystem(gameInstance).FindWallInLineOnlyHumanNavmesh(start, end, NavGenAgentSize.Human, 1.00);
  Log(ToString(fw.status));
  Log(ToString(fw.isHit));
  Log(ToString(fw.hitPosition.X));
  Log(ToString(fw.hitPosition.Y));
  Log(ToString(fw.hitPosition.Z));
}

public static exec func PrevSys_on(gameInstance: GameInstance) -> Void {
  let request: ref<PreventionConsoleInstructionRequest>;
  let system: ref<PreventionSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"PreventionSystem") as PreventionSystem;
  if IsDefined(system) {
    request = new PreventionConsoleInstructionRequest();
    request.instruction = EPreventionSystemInstruction.On;
    system.QueueRequest(request);
  };
}

public static exec func PrevSys_off(gameInstance: GameInstance) -> Void {
  let request: ref<PreventionConsoleInstructionRequest>;
  let system: ref<PreventionSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"PreventionSystem") as PreventionSystem;
  if IsDefined(system) {
    request = new PreventionConsoleInstructionRequest();
    request.instruction = EPreventionSystemInstruction.Off;
    system.QueueRequest(request);
  };
}

public static exec func PrevSys_safe(gameInstance: GameInstance) -> Void {
  let request: ref<PreventionConsoleInstructionRequest>;
  let system: ref<PreventionSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"PreventionSystem") as PreventionSystem;
  if IsDefined(system) {
    request = new PreventionConsoleInstructionRequest();
    request.instruction = EPreventionSystemInstruction.Safe;
    system.QueueRequest(request);
  };
}

public static exec func PrevSys_active(gameInstance: GameInstance, opt heatLevel: String) -> Void {
  let request: ref<PreventionConsoleInstructionRequest>;
  let system: ref<PreventionSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"PreventionSystem") as PreventionSystem;
  if IsDefined(system) {
    request = new PreventionConsoleInstructionRequest();
    request.instruction = EPreventionSystemInstruction.Active;
    if NotEquals(heatLevel, "") && IsStringNumber(heatLevel) {
      request.heatStage = IntToEPreventionHeatStage(StringToInt(heatLevel));
    };
    system.QueueRequest(request);
  };
}

public static exec func DbgBraindanceIsActive(gameInstance: GameInstance) -> Void {
  let value: Bool = GameInstance.GetSceneSystem(gameInstance).GetScriptInterface().IsRewindableSectionActive();
  Log("Braindance active: " + BoolToString(value));
}

public static exec func DbgBraindanceProgress(gameInstance: GameInstance) -> Void {
  let value: Float = GameInstance.GetSceneSystem(gameInstance).GetScriptInterface().GetRewindableSectionProgress();
  Log("Braindance progress: " + FloatToString(value * 100.00) + "%");
}

public static exec func DbgBraindanceTimeInSec(gameInstance: GameInstance) -> Void {
  let value: Float = GameInstance.GetSceneSystem(gameInstance).GetScriptInterface().GetRewindableSectionTimeInSec();
  Log("Braindance time: " + FloatToString(value) + "s");
}

public static exec func DbgBraindancePlayDirection(gameInstance: GameInstance) -> Void {
  let value: scnPlayDirection = GameInstance.GetSceneSystem(gameInstance).GetScriptInterface().GetRewindableSectionPlayDirection();
  Log("Braindance play direction: " + EnumValueToString("scnPlayDirection", Cast<Int64>(EnumInt(value))));
}

public static exec func DbgBraindanceSetPlayDirection(gameInstance: GameInstance, direction: String) -> Void {
  let directionInt: Int32 = Cast<Int32>(EnumValueFromString("scnPlayDirection", direction));
  if directionInt != -1 {
    GameInstance.GetSceneSystem(gameInstance).GetScriptInterface().SetRewindableSectionPlayDirection(IntEnum<scnPlayDirection>(directionInt));
  };
}

public static exec func DbgBraindancePlaySpeed(gameInstance: GameInstance) -> Void {
  let value: scnPlaySpeed = GameInstance.GetSceneSystem(gameInstance).GetScriptInterface().GetRewindableSectionPlaySpeed();
  Log("Braindance play speed: " + EnumValueToString("scnPlaySpeed", Cast<Int64>(EnumInt(value))));
}

public static exec func DbgBraindanceSetPlaySpeed(gameInstance: GameInstance, speed: String) -> Void {
  let speedInt: Int32 = Cast<Int32>(EnumValueFromString("scnPlaySpeed", speed));
  if speedInt != -1 {
    GameInstance.GetSceneSystem(gameInstance).GetScriptInterface().SetRewindableSectionPlaySpeed(IntEnum<scnPlaySpeed>(speedInt));
  };
}

public static exec func DbgBraindanceIsPaused(gameInstance: GameInstance) -> Void {
  let value: Bool = GameInstance.GetSceneSystem(gameInstance).GetScriptInterface().IsRewindableSectionPaused();
  Log("Braindance paused: " + BoolToString(value));
}

public static exec func EnterBD(gameInstance: GameInstance) -> Void {
  let psmAdd: ref<PSMAddOnDemandStateMachine> = new PSMAddOnDemandStateMachine();
  psmAdd.stateMachineName = n"BraindanceControls";
  GetPlayer(gameInstance).QueueEvent(psmAdd);
  AnimationControllerComponent.SetInputBool(GetPlayer(gameInstance), n"disable_camera_bobbing", true);
}

public static exec func LeaveBD(gameInstance: GameInstance) -> Void {
  let stateMachineIdentifier: StateMachineIdentifier;
  let psmRem: ref<PSMRemoveOnDemandStateMachine> = new PSMRemoveOnDemandStateMachine();
  stateMachineIdentifier.definitionName = n"BraindanceControls";
  psmRem.stateMachineIdentifier = stateMachineIdentifier;
  GetPlayer(gameInstance).QueueEvent(psmRem);
  AnimationControllerComponent.SetInputBool(GetPlayer(gameInstance), n"disable_camera_bobbing", false);
}

public static exec func DespawnPlayerVehicle(inst: GameInstance, vehicleID: String) -> Void {
  GameInstance.GetVehicleSystem(inst).DespawnPlayerVehicle(GarageVehicleID.Resolve(vehicleID));
}

public static exec func EnableAllPlayerVehicles(inst: GameInstance) -> Void {
  GameInstance.GetVehicleSystem(inst).EnableAllPlayerVehicles();
}

public static exec func WorkspotEnableVisualLog(instance: GameInstance, entId: String) -> Void {
  let workspotSystem: ref<WorkspotGameSystem> = GameInstance.GetWorkspotSystem(instance);
  workspotSystem.SendDebugCommand(workWorkspotDebugMode.VisualLogOn, entId);
}

public static exec func WorkspotDisableVisualLog(instance: GameInstance, entId: String) -> Void {
  let workspotSystem: ref<WorkspotGameSystem> = GameInstance.GetWorkspotSystem(instance);
  workspotSystem.SendDebugCommand(workWorkspotDebugMode.VisualLogOff, entId);
}

public static exec func WorkspotEnableStateView(instance: GameInstance, entId: String) -> Void {
  let workspotSystem: ref<WorkspotGameSystem> = GameInstance.GetWorkspotSystem(instance);
  workspotSystem.SendDebugCommand(workWorkspotDebugMode.VisualStateOn, entId);
}

public static exec func WorkspotDisableStateView(instance: GameInstance, entId: String) -> Void {
  let workspotSystem: ref<WorkspotGameSystem> = GameInstance.GetWorkspotSystem(instance);
  workspotSystem.SendDebugCommand(workWorkspotDebugMode.VisualStateOff, entId);
}

public static exec func DebugSS(game: GameInstance, val: String) -> Void {
  let str: String;
  let num: Int32 = StringToInt(val);
  if num == 0 || num == 1 {
    SetFactValue(game, n"debugSS", num);
    return;
  };
  str = StrLower(val);
  if Equals(str, "true") {
    num = 1;
  } else {
    if Equals(str, "false") {
      num = 0;
    };
  };
  SetFactValue(game, n"debugSS", num);
}

public static exec func UploadProgram(gameInstance: GameInstance, programNumber: String) -> Void {
  let program: Int32 = StringToInt(programNumber);
  SetFactValue(gameInstance, n"upload_program", program);
  Log("Program:" + programNumber + " uploaded");
}

public static exec func CreateSet(inst: GameInstance) -> Void {
  let itemID: ItemID;
  let itemTDBID: TweakDBID;
  let setItem: SSlotVisualInfo;
  let set: ref<ClothingSet> = new ClothingSet();
  set.setID = gameWardrobeClothingSetIndex.Slot1;
  setItem.areaType = gamedataEquipmentArea.InnerChest;
  ArrayPush(set.clothingList, setItem);
  setItem.areaType = gamedataEquipmentArea.Feet;
  ArrayPush(set.clothingList, setItem);
  itemTDBID = t"Items.Cap_01_basic_02";
  itemID = ItemID.FromTDBID(itemTDBID);
  setItem.visualItem = itemID;
  setItem.areaType = gamedataEquipmentArea.Head;
  ArrayPush(set.clothingList, setItem);
  itemTDBID = t"Items.Mask_02_rich_02";
  itemID = ItemID.FromTDBID(itemTDBID);
  setItem.visualItem = itemID;
  setItem.areaType = gamedataEquipmentArea.Face;
  ArrayPush(set.clothingList, setItem);
  itemTDBID = t"Items.Jacket_02_rich_01";
  itemID = ItemID.FromTDBID(itemTDBID);
  setItem.visualItem = itemID;
  setItem.areaType = gamedataEquipmentArea.OuterChest;
  ArrayPush(set.clothingList, setItem);
  itemTDBID = t"Items.Shorts_01_old_02";
  itemID = ItemID.FromTDBID(itemTDBID);
  setItem.visualItem = itemID;
  setItem.areaType = gamedataEquipmentArea.Legs;
  ArrayPush(set.clothingList, setItem);
  GameInstance.GetWardrobeSystem(inst).PushBackClothingSet(set);
}

public static exec func EquipSet(inst: GameInstance, setID: String) -> Void {
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(inst).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let req: ref<EquipWardrobeSetRequest> = new EquipWardrobeSetRequest();
  req.setID = WardrobeSystem.NumberToWardrobeClothingSetIndex(StringToInt(setID));
  req.owner = player;
  let equipSys: ref<EquipmentSystem> = GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem") as EquipmentSystem;
  equipSys.QueueRequest(req);
}

public static exec func UnequipSet(inst: GameInstance) -> Void {
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(inst).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let req: ref<UnequipWardrobeSetRequest> = new UnequipWardrobeSetRequest();
  req.owner = player;
  let equipSys: ref<EquipmentSystem> = GameInstance.GetScriptableSystemsContainer(inst).Get(n"EquipmentSystem") as EquipmentSystem;
  equipSys.QueueRequest(req);
}

public static exec func EnableQuickHacks(gameInstance: GameInstance, shouldEnable: String) -> Void {
  let enableQuickHacks: Int32 = StringToInt(shouldEnable);
  SetFactValue(gameInstance, n"DebugEnableQuickHacks", enableQuickHacks);
}

public static exec func BreachNearestAP(gameInstance: GameInstance) -> Void {
  let es: ref<EffectSystem> = GameInstance.GetGameEffectSystem(gameInstance);
  let player: ref<Entity> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject();
  let searchForAPEffect: ref<EffectInstance> = es.CreateEffectStatic(n"deviceEffects", n"DebugFindNearestAP", player);
  EffectData.SetVector(searchForAPEffect.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, (player as GameObject).GetWorldPosition());
  EffectData.SetFloat(searchForAPEffect.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.radius, 100.00);
  searchForAPEffect.Run();
}

public static exec func BreachAllNetworks(gameInstance: GameInstance, opt radius: String) -> Void {
  let radiusValue: Float;
  let es: ref<EffectSystem> = GameInstance.GetGameEffectSystem(gameInstance);
  let player: ref<Entity> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject();
  let searchForAPEffect: ref<EffectInstance> = es.CreateEffectStatic(n"deviceEffects", n"DebugFindAPs", player);
  EffectData.SetVector(searchForAPEffect.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, (player as GameObject).GetWorldPosition());
  radiusValue = StringToFloat(radius);
  if radiusValue > 1.00 {
    EffectData.SetFloat(searchForAPEffect.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.radius, radiusValue);
  } else {
    EffectData.SetFloat(searchForAPEffect.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.radius, 100.00);
  };
  searchForAPEffect.Run();
}

public static exec func DbgDvs(gameInstance: GameInstance, shouldDebug: String) -> Void {
  let enableDebug: Bool = StringToBool(shouldDebug);
  DebugDevices(gameInstance, enableDebug);
}

public static exec func DD(gameInstance: GameInstance, shouldDebug: String) -> Void {
  let enableDebug: Bool = StringToBool(shouldDebug);
  DebugDevices(gameInstance, enableDebug);
}

public static exec func DebugDevices(gameInstance: GameInstance, shouldDebug: String) -> Void {
  let enableDebug: Bool = StringToBool(shouldDebug);
  DebugDevices(gameInstance, enableDebug);
}

public static exec func CheckFactValue(gameInstance: GameInstance, fact: String) -> Void {
  let convertedFact: CName = StringToName(fact);
  let value: Int32 = GetFact(gameInstance, convertedFact);
  Log("Fact " + fact + ": " + IntToString(value));
}

public static exec func Hotkeys(gameInstance: GameInstance) -> Void {
  DebugGiveHotkeys(gameInstance);
}

public static exec func HotkeysNOW(gameInstance: GameInstance) -> Void {
  DebugGiveHotkeys(gameInstance);
}

public static exec func AddDebugFact(gameInstance: GameInstance, fact: String) -> Void {
  let convertedFact: CName = StringToName(fact);
  AddFact(gameInstance, convertedFact);
}

public static exec func SetDebugFact(gameInstance: GameInstance, fact: String, value: String) -> Void {
  let convertedFact: CName = StringToName(fact);
  SetFactValue(gameInstance, convertedFact, StringToInt(value));
}

public static exec func ItemActionsHelper_ConsumeItem(executor: wref<GameObject>, itemID: ItemID, fromInventory: Bool) -> Void {
  ItemActionsHelper.ConsumeItem(executor, itemID, fromInventory);
}

public static exec func SilenceWeapon(gameInstance: GameInstance, flag: String) -> Void {
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;
  let blackboardSystem: ref<BlackboardSystem> = GameInstance.GetBlackboardSystem(gameInstance);
  let blackboard: ref<IBlackboard> = blackboardSystem.GetLocalInstanced(playerPuppet.GetEntityID(), GetAllBlackboardDefs().PlayerStateMachine);
  blackboard.SetBool(GetAllBlackboardDefs().PlayerStateMachine.DEBUG_SilencedWeapon, StringToBool(flag));
}

public static exec func ApplyGLP(gameInstance: GameInstance, value: String) -> Void {
  let glpID: TweakDBID = TDBID.Create(value);
  let glpRecord: wref<GameplayLogicPackage_Record> = TweakDBInterface.GetGameplayLogicPackageRecord(glpID);
  if IsDefined(glpRecord) {
    RPGManager.ApplyGLP(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject(), glpRecord);
  };
}

public static exec func ForcedNPCDeath(gi: GameInstance) -> Void {
  let forcedDeathEvent: ref<ForcedDeathEvent> = new ForcedDeathEvent();
  forcedDeathEvent.hitIntensity = EnumInt(EAIHitIntensity.Medium);
  forcedDeathEvent.hitSource = EnumInt(EAIHitSource.MeleeSharp);
  forcedDeathEvent.hitType = EnumInt(animHitReactionType.Death);
  forcedDeathEvent.hitBodyPart = 1;
  forcedDeathEvent.hitNpcMovementSpeed = 0;
  forcedDeathEvent.hitDirection = 4;
  forcedDeathEvent.hitNpcMovementDirection = 0;
  let localPlayer: ref<GameObject> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject();
  GameInstance.GetTargetingSystem(gi).GetLookAtObject(localPlayer).QueueEvent(forcedDeathEvent);
}

public static exec func SetAnimFloatOnTarget(gameInstance: GameInstance, floatValue: String) -> Void {
  let angleDist: EulerAngles;
  let targetNPC: ref<NPCPuppet> = GameInstance.GetTargetingSystem(gameInstance).GetObjectClosestToCrosshair(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), angleDist, TSQ_ALL()) as NPCPuppet;
  if IsDefined(targetNPC) {
    AnimationControllerComponent.SetInputFloat(targetNPC, n"debug_float_a", StringToFloat(floatValue, 0.00));
  } else {
    Log("execSetAnimGraphFloat::: NPC NOT FOUND!!");
  };
}

public static exec func SetDebugSceneTierThreshold2(gameInstance: GameInstance) -> Void {
  let request: ref<SetDebugSceneThrehsold> = new SetDebugSceneThrehsold();
  request.newThreshold = 2;
  let bdSystem: ref<BraindanceSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"BraindanceSystem") as BraindanceSystem;
  bdSystem.QueueRequest(request);
}

public static exec func SetDebugSceneTierThreshold1(gameInstance: GameInstance) -> Void {
  let request: ref<SetDebugSceneThrehsold> = new SetDebugSceneThrehsold();
  request.newThreshold = 1;
  let bdSystem: ref<BraindanceSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"BraindanceSystem") as BraindanceSystem;
  bdSystem.QueueRequest(request);
}

public static exec func SetDebugSceneTierThreshold3(gameInstance: GameInstance) -> Void {
  let request: ref<SetDebugSceneThrehsold> = new SetDebugSceneThrehsold();
  request.newThreshold = 3;
  let bdSystem: ref<BraindanceSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"BraindanceSystem") as BraindanceSystem;
  bdSystem.QueueRequest(request);
}

public static exec func BlockSwitchSeats(gi: GameInstance, block: String) -> Void {
  let debugBB: ref<IBlackboard> = GameInstance.GetBlackboardSystem(gi).Get(GetAllBlackboardDefs().DebugData);
  debugBB.SetBool(GetAllBlackboardDefs().DebugData.Vehicle_BlockSwitchSeats, StringToBool(block));
}

public static exec func TestForcePlayerInvisible(gameInstance: GameInstance, value: String) -> Void {
  let setInvisible: Bool = Cast<Bool>(StringToInt(value));
  let localPlayer: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  localPlayer.SetInvisible(setInvisible);
}

public static exec func LogGender(gameInstance: GameInstance) -> Void {
  let playerPuppet: ref<ScriptedPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as ScriptedPuppet;
  Log("*** Player Gender: " + NameToString(playerPuppet.GetResolvedGenderName()));
}

public static exec func CheatExposeNPCQuickHacks(gameInstance: GameInstance) -> Void {
  SetFactValue(gameInstance, n"cheat_expose_npc_quick_hacks", 1);
}

public static exec func UnlockAllAchievements(gameInstance: GameInstance) -> Void {
  let evt: ref<UnlockAllAchievementsRequest> = new UnlockAllAchievementsRequest();
  let dataTrackingSystem: ref<DataTrackingSystem> = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"DataTrackingSystem") as DataTrackingSystem;
  dataTrackingSystem.QueueRequest(evt);
}

public static exec func UnlockAchievementEnum(gameInstance: GameInstance, achievementString: String) -> Void {
  let dataTrackingSystem: ref<DataTrackingSystem>;
  let evt: ref<AddAchievementRequest> = new AddAchievementRequest();
  let i: Int32 = Cast<Int32>(EnumValueFromString("gamedataAchievement", achievementString));
  if i >= 0 && i < EnumInt(gamedataAchievement.Count) {
    evt.achievement = IntEnum<gamedataAchievement>(i);
    dataTrackingSystem = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"DataTrackingSystem") as DataTrackingSystem;
    dataTrackingSystem.QueueRequest(evt);
  };
}

public static exec func UnlockAchievementInt(gameInstance: GameInstance, achievementNum: String) -> Void {
  let dataTrackingSystem: ref<DataTrackingSystem>;
  let gdAchievement: gamedataAchievement;
  let evt: ref<AddAchievementRequest> = new AddAchievementRequest();
  let i: Int32 = StringToInt(achievementNum);
  if i >= 0 && i < EnumInt(gamedataAchievement.Count) {
    gdAchievement = IntEnum<gamedataAchievement>(i);
    evt.achievement = gdAchievement;
    dataTrackingSystem = GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"DataTrackingSystem") as DataTrackingSystem;
    dataTrackingSystem.QueueRequest(evt);
  };
}

public static exec func SetActionContext(gameInstance: GameInstance) -> Void {
  let ContextRequest: ref<ChangeActiveContextRequest> = new ChangeActiveContextRequest();
  ContextRequest.newContext = inputContextType.Action;
  let setProgressionBuildReq: ref<SetProgressionBuild> = new SetProgressionBuild();
  setProgressionBuildReq.Set(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), gamedataBuildType.StartingBuild);
  GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"InputContextSystem").QueueRequest(ContextRequest);
  GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"PlayerDevelopmentSystem").QueueRequest(setProgressionBuildReq);
}

public static exec func SetRpgContext(gameInstance: GameInstance) -> Void {
  let ContextRequest: ref<ChangeActiveContextRequest> = new ChangeActiveContextRequest();
  ContextRequest.newContext = inputContextType.RPG;
  let setProgressionBuildReq: ref<SetProgressionBuild> = new SetProgressionBuild();
  setProgressionBuildReq.Set(GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject(), gamedataBuildType.StartingBuild);
  GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"InputContextSystem").QueueRequest(ContextRequest);
  GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"PlayerDevelopmentSystem").QueueRequest(setProgressionBuildReq);
}

public static exec func SpawnFlathead(gi: GameInstance) -> Void {
  let spawnFlatheadRequest: ref<SpawnUniqueSubCharacterRequest>;
  let scs: ref<SubCharacterSystem> = GameInstance.GetScriptableSystemsContainer(gi).Get(n"SubCharacterSystem") as SubCharacterSystem;
  if IsDefined(scs) {
    spawnFlatheadRequest = new SpawnUniqueSubCharacterRequest();
    spawnFlatheadRequest.subCharacterID = t"Character.spiderbot_new";
    scs.QueueRequest(spawnFlatheadRequest);
  };
}

public static exec func DespawnFlathead(gi: GameInstance) -> Void {
  let despawnFlatheadRequest: ref<DespawnUniqueSubCharacterRequest>;
  let scs: ref<SubCharacterSystem> = GameInstance.GetScriptableSystemsContainer(gi).Get(n"SubCharacterSystem") as SubCharacterSystem;
  if IsDefined(scs) {
    despawnFlatheadRequest = new DespawnUniqueSubCharacterRequest();
    despawnFlatheadRequest.subCharacterID = t"Character.spiderbot_new";
    scs.QueueRequest(despawnFlatheadRequest);
  };
}

public static exec func DbgMarkPatchIntroAsSeen(gameInstance: GameInstance) -> Void {
  GameInstance.GetUISystem(gameInstance).MarkPatchIntroAsSeen(gameuiPatchIntro.Patch1500_NextGen);
  GameInstance.GetUISystem(gameInstance).MarkPatchIntroAsSeen(gameuiPatchIntro.Patch1600);
}

public static exec func DbgResetPatchIntro(gameInstance: GameInstance) -> Void {
  GameInstance.GetUISystem(gameInstance).ResetPatchIntro(gameuiPatchIntro.Patch1500_NextGen);
  GameInstance.GetUISystem(gameInstance).ResetPatchIntro(gameuiPatchIntro.Patch1600);
}

public static exec func testq101done(gi: GameInstance) -> Void {
  AddFact(gi, n"q101_done", 1);
}

public static exec func testmapblocked(gi: GameInstance) -> Void {
  AddFact(gi, n"map_blocked", 1);
}

public static exec func TestNotification(gameInstance: GameInstance) -> Void {
  let evt: ref<CustomNotificationEvent> = new CustomNotificationEvent();
  evt.header = "Test header";
  evt.description = "Test description";
  let uiSystem: ref<UISystem> = GameInstance.GetUISystem(GetGameInstance());
  uiSystem.QueueEvent(evt);
}

public static exec func awacstest(gi: GameInstance) -> Void {
  AddFact(gi, n"awacs_warning", 1);
}

public static exec func ResetOneTimeMessages(gameInstance: GameInstance) -> Void {
  GameInstance.GetUISystem(gameInstance).SetOneTimeMessageSeen(gameuiOneTimeMessage.XboxCompatibilityLimitation, false);
}

public static exec func mwtest(gi: GameInstance) -> Void {
  AddFact(gi, n"militech_warning", 1);
}

public static exec func t1(gi: GameInstance) -> Void {
  AddFact(gi, n"sq030_braindance_active", 1);
}

public static exec func t2(gi: GameInstance) -> Void {
  AddFact(gi, n"sq030_braindance_active", -1);
}

public static exec func EnableTransmog(gi: GameInstance) -> Void {
  SetFactValue(gi, n"transmog_enabled", 1);
}

public static exec func PreviewDamage(gameInstance: GameInstance, value: String) -> Void {
  let intValue: Int32 = StringToInt(value);
  let blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(gameInstance).Get(GetAllBlackboardDefs().UI_NameplateData);
  if IsDefined(blackboard) {
    blackboard.SetInt(GetAllBlackboardDefs().UI_NameplateData.DamageProjection, intValue, true);
  };
}

public static exec func test_inputhint(gameInstance: GameInstance) -> Void {
  let data: InputHintData;
  data.action = n"UI_Apply";
  data.source = n"DebugDefault";
  data.localizedLabel = "Debug 1";
  data.queuePriority = 0;
  data.sortingPriority = 0;
  let evt: ref<UpdateInputHintEvent> = new UpdateInputHintEvent();
  evt.data = data;
  evt.show = true;
  evt.targetHintContainer = n"GameplayInputHelper";
  GameInstance.GetUISystem(gameInstance).QueueEvent(evt);
}

public static exec func test_inputhint1(gameInstance: GameInstance) -> Void {
  let data: InputHintData;
  data.action = n"UI_Cancel";
  data.source = n"Debug";
  data.localizedLabel = "Debug 2";
  data.queuePriority = 0;
  data.sortingPriority = 0;
  let evt: ref<UpdateInputHintEvent> = new UpdateInputHintEvent();
  evt.data = data;
  evt.show = true;
  evt.targetHintContainer = n"GameplayInputHelper";
  GameInstance.GetUISystem(gameInstance).QueueEvent(evt);
}

public static exec func test_group(gameInstance: GameInstance) -> Void {
  let data: InputHintGroupData;
  data.localizedTitle = "Test title";
  data.localizedDescription = "Test description";
  data.sortingPriority = 0;
  let evt: ref<AddInputGroupEvent> = new AddInputGroupEvent();
  evt.data = data;
  evt.groupId = n"test1";
  evt.targetHintContainer = n"GameplayInputHelper";
  GameInstance.GetUISystem(gameInstance).QueueEvent(evt);
}

public static exec func test_inputhint_clear(gameInstance: GameInstance) -> Void {
  let evt: ref<DeleteInputHintBySourceEvent> = new DeleteInputHintBySourceEvent();
  evt.source = n"Debug";
  evt.targetHintContainer = n"GameplayInputHelper";
  GameInstance.GetUISystem(gameInstance).QueueEvent(evt);
}

public static exec func TestCustomQuestNotification(gameInstance: GameInstance) -> Void {
  let fakeData: CustomQuestNotificationData;
  let player: ref<PlayerPuppet> = GetPlayer(gameInstance);
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).Get(GetAllBlackboardDefs().UI_CustomQuestNotification);
  fakeData.header = "TEST";
  fakeData.desc = "REALLY LONG TEXT, REALLY LONG TEXT";
  fakeData.icon = n"danger_zone_icon";
  if IsDefined(Blackboard) {
    Blackboard.SetVariant(GetAllBlackboardDefs().UI_CustomQuestNotification.data, ToVariant(fakeData));
    Blackboard.SignalVariant(GetAllBlackboardDefs().UI_CustomQuestNotification.data);
  };
}

public static exec func LevelUp(gameInstance: GameInstance) -> Void {
  let level: LevelUpData;
  level.lvl = 10;
  level.type = gamedataProficiencyType.Level;
  let player: ref<PlayerPuppet> = GetPlayer(gameInstance);
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).Get(GetAllBlackboardDefs().UI_LevelUp);
  if IsDefined(Blackboard) {
    Blackboard.SetVariant(GetAllBlackboardDefs().UI_LevelUp.level, ToVariant(level));
    Blackboard.SignalVariant(GetAllBlackboardDefs().UI_LevelUp.level);
  };
}

public static exec func StreetCredUp(gameInstance: GameInstance) -> Void {
  let level: LevelUpData;
  level.lvl = 10;
  level.type = gamedataProficiencyType.StreetCred;
  let player: ref<PlayerPuppet> = GetPlayer(gameInstance);
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).Get(GetAllBlackboardDefs().UI_LevelUp);
  if IsDefined(Blackboard) {
    Blackboard.SetVariant(GetAllBlackboardDefs().UI_LevelUp.level, ToVariant(level));
    Blackboard.SignalVariant(GetAllBlackboardDefs().UI_LevelUp.level);
  };
}

public static exec func DemolitionUp(gameInstance: GameInstance) -> Void {
  let level: LevelUpData;
  level.lvl = 10;
  level.type = gamedataProficiencyType.Demolition;
  let player: ref<PlayerPuppet> = GetPlayer(gameInstance);
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).Get(GetAllBlackboardDefs().UI_LevelUp);
  if IsDefined(Blackboard) {
    Blackboard.SetVariant(GetAllBlackboardDefs().UI_LevelUp.level, ToVariant(level));
    Blackboard.SignalVariant(GetAllBlackboardDefs().UI_LevelUp.level);
  };
}

public static exec func ChangeArea(gameInstance: GameInstance) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gameInstance);
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).Get(GetAllBlackboardDefs().UI_Map);
  if IsDefined(Blackboard) {
    Blackboard.SetString(GetAllBlackboardDefs().UI_Map.currentLocation, "NEW AREA TEST");
    Blackboard.SignalString(GetAllBlackboardDefs().UI_Map.currentLocation);
  };
}

public static exec func ChangeZoneIndicatorDanger(gameInstance: GameInstance) -> Void {
  let SecurityData: SecurityAreaData;
  SecurityData.securityAreaType = ESecurityAreaType.DANGEROUS;
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).GetLocalInstanced(player.GetEntityID(), GetAllBlackboardDefs().PlayerStateMachine);
  if IsDefined(Blackboard) {
    Blackboard.SetVariant(GetAllBlackboardDefs().PlayerStateMachine.SecurityZoneData, ToVariant(SecurityData));
    Blackboard.SignalVariant(GetAllBlackboardDefs().PlayerStateMachine.SecurityZoneData);
  };
}

public static exec func ChangeZoneIndicatorSafe(gameInstance: GameInstance) -> Void {
  let SecurityData: SecurityAreaData;
  SecurityData.securityAreaType = ESecurityAreaType.SAFE;
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).GetLocalInstanced(player.GetEntityID(), GetAllBlackboardDefs().PlayerStateMachine);
  if IsDefined(Blackboard) {
    Blackboard.SetVariant(GetAllBlackboardDefs().PlayerStateMachine.SecurityZoneData, ToVariant(SecurityData));
    Blackboard.SignalVariant(GetAllBlackboardDefs().PlayerStateMachine.SecurityZoneData);
  };
}

public static exec func ChangeZoneIndicatorRestricted(gameInstance: GameInstance) -> Void {
  let SecurityData: SecurityAreaData;
  SecurityData.securityAreaType = ESecurityAreaType.RESTRICTED;
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).GetLocalInstanced(player.GetEntityID(), GetAllBlackboardDefs().PlayerStateMachine);
  if IsDefined(Blackboard) {
    Blackboard.SetVariant(GetAllBlackboardDefs().PlayerStateMachine.SecurityZoneData, ToVariant(SecurityData));
    Blackboard.SignalVariant(GetAllBlackboardDefs().PlayerStateMachine.SecurityZoneData);
  };
}

public static exec func ChangeZoneIndicatorPublic(gameInstance: GameInstance) -> Void {
  let SecurityData: SecurityAreaData;
  SecurityData.securityAreaType = ESecurityAreaType.DISABLED;
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerControlledGameObject() as PlayerPuppet;
  let Blackboard: ref<IBlackboard> = GameInstance.GetBlackboardSystem(player.GetGame()).GetLocalInstanced(player.GetEntityID(), GetAllBlackboardDefs().PlayerStateMachine);
  if IsDefined(Blackboard) {
    Blackboard.SetVariant(GetAllBlackboardDefs().PlayerStateMachine.SecurityZoneData, ToVariant(SecurityData));
    Blackboard.SignalVariant(GetAllBlackboardDefs().PlayerStateMachine.SecurityZoneData);
  };
}

public static exec func TeleportPlayerToPosition(gi: GameInstance, xStr: String, yStr: String, zStr: String) -> Void {
  let position: Vector4;
  let rotation: EulerAngles;
  let playerPuppet: ref<GameObject> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject();
  position.X = StringToFloat(xStr);
  position.Y = StringToFloat(yStr);
  position.Z = StringToFloat(zStr);
  GameInstance.GetTeleportationFacility(gi).Teleport(playerPuppet, position, rotation);
}

public static exec func Slowmo(gameInstance: GameInstance) -> Void {
  GameInstance.GetTimeSystem(gameInstance).SetTimeDilation(n"consoleCommand", 0.10);
}

public static exec func Noslowmo(gameInstance: GameInstance) -> Void {
  GameInstance.GetTimeSystem(gameInstance).UnsetTimeDilation(n"consoleCommand");
}

public static exec func SetTimeDilation(gameInstance: GameInstance, amount: String) -> Void {
  let famount: Float = StringToFloat(amount);
  if famount > 0.00 {
    GameInstance.GetTimeSystem(gameInstance).SetTimeDilation(n"consoleCommand", famount);
  } else {
    GameInstance.GetTimeSystem(gameInstance).UnsetTimeDilation(n"consoleCommand");
  };
}

public static exec func BuyItem(inst: GameInstance, item: String) -> Void {
  let buyRequestData: TransactionRequestData;
  buyRequestData.itemID = ItemID.FromTDBID(TDBID.Create(item));
  buyRequestData.quantity = 1;
  let buyRequest: ref<BuyRequest> = new BuyRequest();
  ArrayPush(buyRequest.items, buyRequestData);
  buyRequest.owner = GameInstance.GetTargetingSystem(inst).GetLookAtObject(GetPlayer(inst));
  MarketSystem.GetInstance(inst).QueueRequest(buyRequest);
}

public static exec func SellItem(inst: GameInstance, item: String) -> Void {
  let sellRequestData: TransactionRequestData;
  sellRequestData.itemID = ItemID.FromTDBID(TDBID.Create(item));
  sellRequestData.quantity = 1;
  let sellRequest: ref<SellRequest> = new SellRequest();
  ArrayPush(sellRequest.items, sellRequestData);
  sellRequest.owner = GameInstance.GetTargetingSystem(inst).GetLookAtObject(GetPlayer(inst));
  MarketSystem.GetInstance(inst).QueueRequest(sellRequest);
}
