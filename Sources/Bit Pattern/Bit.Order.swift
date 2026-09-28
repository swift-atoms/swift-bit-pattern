public import Bit

extension Bit {

    public enum Order: Hashable, Swift.Sendable {

        case msb

        case lsb
    }
}

extension Bit.Order {

    @inlinable
    public static func opposite(_ order: Bit.Order) -> Bit.Order {
        switch order {
        case .msb: return .lsb
        case .lsb: return .msb
        }
    }

    @inlinable
    public var opposite: Bit.Order {
        Self.opposite(self)
    }
}
