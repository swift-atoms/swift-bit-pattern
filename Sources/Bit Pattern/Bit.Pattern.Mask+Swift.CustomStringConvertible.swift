public import Bit

extension Bit.Pattern.Mask: Swift.CustomStringConvertible {

    public var description: String {
        "0x" + String(underlying, radix: 16, uppercase: true)
    }
}
