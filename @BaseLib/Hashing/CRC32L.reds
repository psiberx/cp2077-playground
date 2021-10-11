// -----------------------------------------------------------------------------
// CRC32L Hasher
// -----------------------------------------------------------------------------
//
// This is the hashing used by TweakDB.
// Hash consists of CRC32 and original string length:
//

module BaseLib

public abstract class CRC32L {
	public static func Hash(str: String) -> Uint64 {
		return TDBID.ToNumber(TDBID.Create(str));
	}

	public static func Hash(name: CName) -> Uint64 {
		return CRC32L.Hash(NameToString(name));
	}
}
