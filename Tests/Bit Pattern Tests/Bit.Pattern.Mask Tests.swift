import Bit
import Bit_Pattern
import Testing

@Suite
struct `Bit Pattern Mask Tests` {

    @Test
    func `low and high bit masks select contiguous positions`() {
        #expect(Bit.Pattern<UInt8>.Mask.lowBits(4).underlying == 0b0000_1111)
        #expect(Bit.Pattern<UInt8>.Mask.highBits(4).underlying == 0b1111_0000)
        #expect(Bit.Pattern<UInt8>.Mask.lowBits(0) == .zero)
        #expect(Bit.Pattern<UInt8>.Mask.lowBits(8) == .allOnes)
    }

    @Test
    func `single-position mask and containment`() {
        let bit3 = Bit.Pattern<UInt8>.Mask.bit(3)
        #expect(bit3.underlying == 0b0000_1000)
        #expect(Bit.Pattern<UInt8>.Mask.lowBits(4).contains(bit3))
        #expect(!Bit.Pattern<UInt8>.Mask.highBits(4).contains(bit3))
        #expect(Bit.Pattern<UInt8>.Mask.lowBits(4).intersects(bit3))
        #expect(bit3.popcount == 1)
        #expect(!bit3.isEmpty)
    }

    @Test
    func `selector operations follow set semantics`() {
        let low = Bit.Pattern<UInt8>.Mask.lowBits(4)
        let high = Bit.Pattern<UInt8>.Mask.highBits(4)
        #expect((low | high) == .allOnes)
        #expect((low & high) == .zero)
        #expect((low ^ high) == .allOnes)
        #expect(~low == high)
    }
}
