#if Finite
import Bit_Pattern
import Testing

@Suite struct `Bit Finite.Enumerable Tests` {
    @Suite struct Unit {
        @Suite struct `Bit Value` {}
        @Suite struct `Bit Order` {}
    }

    @Suite struct `Edge Case` {}

    @Suite struct Integration {}
}

extension `Bit Finite.Enumerable Tests`.Unit.`Bit Order` {
    @Test
    func `Finite.Enumerable count is 2`() {
        #expect(Bit.Order.count == Cardinal(2))
    }

    @Test
    func `Finite.Enumerable ordinal values`() {
        #expect(Bit.Order.msb.ordinal == Ordinal(0))
        #expect(Bit.Order.lsb.ordinal == Ordinal(1))
    }

    @Test
    func `Finite.Enumerable init from ordinal unchecked`() {
        #expect(Bit.Order(_unchecked: (), ordinal: Ordinal(0)) == .msb)
        #expect(Bit.Order(_unchecked: (), ordinal: Ordinal(1)) == .lsb)
    }
}
#endif
