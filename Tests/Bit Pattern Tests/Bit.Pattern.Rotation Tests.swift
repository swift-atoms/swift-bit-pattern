import Testing

import Bit_Pattern

@Suite
struct `Bit rotation preserves every bit` {
    @Suite struct `Unit tests` {}
    @Suite struct `Edge cases` {}
    @Suite struct `Integration tests` {}
    @Suite(.serialized) struct `Performance tests` {}
}

extension `Bit rotation preserves every bit`.`Unit tests` {
    @Test
    func `rotate right by 2`() {
        let value: UInt8 = 0b1100_0011
        let rotated = value.rotatedRight(by: 2)
        #expect(rotated == 0b1111_0000)
    }

    @Test
    func `rotate left by 2`() {
        let value: UInt8 = 0b1100_0011
        let rotated = value.rotatedLeft(by: 2)
        #expect(rotated == 0b0000_1111)
    }

    @Test
    func `rotate right then left returns original`() {
        let value: UInt32 = 0xDEAD_BEEF
        let rotated = value.rotatedRight(by: 7).rotatedLeft(by: 7)
        #expect(rotated == value)
    }
}

extension `Bit rotation preserves every bit`.`Edge cases` {
    @Test
    func `rotate by zero returns original`() {
        let value: UInt8 = 0b1100_0011
        #expect(value.rotatedRight(by: 0) == value)
        #expect(value.rotatedLeft(by: 0) == value)
    }

    @Test
    func `rotate by bit width returns original`() {
        let value: UInt8 = 0b1100_0011
        #expect(value.rotatedRight(by: 8) == value)
        #expect(value.rotatedLeft(by: 8) == value)
    }

    @Test
    func `rotate right by 1 on Int8 min is a positive value not sign-extended`() {

        let value = Int8.min
        #expect(value.rotatedRight(by: 1) == 64)
    }

    @Test
    func `rotate left by 1 on Int8 min is a positive value not sign-extended`() {

        let value = Int8.min
        #expect(value.rotatedLeft(by: 1) == 1)
    }

    @Test
    func `rotate right by 1 on Int min is a positive value not sign-extended`() {

        let value = Int.min
        #expect(value.rotatedRight(by: 1) == 4_611_686_018_427_387_904)
    }

    @Test
    func `rotate right by 3 on negative Int16 does not sign extend intermediate bits`() {

        let value: Int16 = -100
        #expect(value.rotatedRight(by: 3) == Int16(bitPattern: 0x9FF3))
    }
}
