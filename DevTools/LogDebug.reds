// -----------------------------------------------------------------------------
// Debug Log Channel
// -----------------------------------------------------------------------------

public static func LogDebug(const str: script_ref<String>) -> Void {
  LogChannel(n"DEBUG", str);
}

public static func Debug(const str: script_ref<String>) -> Void {
  LogChannel(n"DEBUG", str);
}
