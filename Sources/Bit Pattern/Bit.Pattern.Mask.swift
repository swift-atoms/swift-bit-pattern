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
