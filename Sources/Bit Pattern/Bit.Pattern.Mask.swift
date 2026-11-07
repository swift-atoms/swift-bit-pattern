public import Bit

extension Bit.Pattern {

    public struct Mask: Equatable, Hashable {

        public let underlying: Carrier

        @inlinable
        public init(_ underlying: Carrier) {
            self.underlying = underlying
        }
    }
}

extension Bit.Pattern.Mask: Swift::CustomStringConvertible {

    public var description: String {
        "0x" + String(underlying, radix: 16, uppercase: true)
    }
}
