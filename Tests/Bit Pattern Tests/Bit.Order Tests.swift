import Bit
import Bit_Pattern
import Testing

@Suite
struct `Bit order distinguishes the least and most significant positions` {

    @Test
    func `msb and lsb are distinct`() {
        #expect(Bit.Order.msb != Bit.Order.lsb)
    }

    @Test
    func `opposite swaps the order`() {
        #expect(Bit.Order.msb.opposite == .lsb)
        #expect(Bit.Order.lsb.opposite == .msb)
        #expect(Bit.Order.opposite(.msb) == .lsb)
        #expect(Bit.Order.opposite(.lsb) == .msb)
    }

    @Test
    func `case iteration is complete`() {
        #expect(Bit.Order.allCases == [.msb, .lsb])
    }
}
