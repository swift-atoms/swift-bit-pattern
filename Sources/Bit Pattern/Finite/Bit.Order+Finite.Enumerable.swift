#if Finite
public import Bit
public import Cardinal
public import Finite
import Index
public import Ordinal
import Tagged

extension Bit.Order: Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(2) }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .msb: Ordinal(0)
        case .lsb: Ordinal(1)
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = ordinal.rawValue == 0 ? .msb : .lsb
    }
}
#endif
