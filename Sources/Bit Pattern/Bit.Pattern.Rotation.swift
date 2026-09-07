public import Bit

extension Bit.Pattern {


    @inlinable
    public static func rotatedLeft(_ word: Carrier, by count: Int) -> Carrier {
        let remainder = count % Carrier.bitWidth
        let shift = remainder < 0 ? remainder + Carrier.bitWidth : remainder
        guard shift != 0 else { return word }
        return (word << shift) | (word >> (Carrier.bitWidth - shift))
    }

    @inlinable
    public static func rotatedRight(_ word: Carrier, by count: Int) -> Carrier {
        let remainder = count % Carrier.bitWidth
        let shift = remainder < 0 ? remainder + Carrier.bitWidth : remainder
        guard shift != 0 else { return word }
        return (word >> shift) | (word << (Carrier.bitWidth - shift))
    }
}
