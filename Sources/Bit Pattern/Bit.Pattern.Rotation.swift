public import Bit

extension Bit.Pattern {
    /// Rotates the finite bit pattern. Counts are reduced modulo its width.
    /// Negative counts rotate in the opposite direction.
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
