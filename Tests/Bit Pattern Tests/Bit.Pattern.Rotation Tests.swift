import Testing

import Bit_Pattern

@Suite
struct `Bit rotation preserves every bit` {
    @Suite struct `Bit rotations wrap positions and invert each other` {}
    @Suite struct `Bit rotation normalizes counts and preserves signed bit patterns` {}
    @Suite struct `No bit rotation integration cases are defined` {}
    @Suite(.serialized) struct `No bit rotation performance cases are defined` {}
}

extension `Bit rotation preserves every bit`.`Bit rotations wrap positions and invert each other` {
    @Test
    func `Right rotation wraps the lowest two bits to the highest positions`() {
        let value: UInt8 = 0b1100_0011
        let rotated = value.rotatedRight(by: 2)
        #expect(rotated == 0b1111_0000)
    }

    @Test
    func `Left rotation wraps the highest two bits to the lowest positions`() {
        let value: UInt8 = 0b1100_0011
        let rotated = value.rotatedLeft(by: 2)
        #expect(rotated == 0b0000_1111)
    }

    @Test
    func `Opposite bit rotations recover the original value`() {
        let value: UInt32 = 0xDEAD_BEEF
        let rotated = value.rotatedRight(by: 7).rotatedLeft(by: 7)
        #expect(rotated == value)
    }
}

extension `Bit rotation preserves every bit`.`Bit rotation normalizes counts and preserves signed bit patterns` {
    @Test
    func `Rotation by zero preserves the original bit pattern`() {
        let value: UInt8 = 0b1100_0011
        #expect(value.rotatedRight(by: 0) == value)
        #expect(value.rotatedLeft(by: 0) == value)
    }

    @Test
    func `Rotation by the bit width preserves the original bit pattern`() {
        let value: UInt8 = 0b1100_0011
        #expect(value.rotatedRight(by: 8) == value)
        #expect(value.rotatedLeft(by: 8) == value)
    }

    @Test
    func `Right rotation of Int8 minimum preserves its single set bit`() {

        let value = Int8.min
        #expect(value.rotatedRight(by: 1) == 64)
    }

    @Test
    func `Left rotation of Int8 minimum wraps its single set bit`() {

        let value = Int8.min
        #expect(value.rotatedLeft(by: 1) == 1)
    }

    @Test
    func `Right rotation of Int minimum preserves its single set bit`() {

        let value = Int.min
        #expect(value.rotatedRight(by: 1) == 4_611_686_018_427_387_904)
    }

    @Test
    func `Right rotation of a negative Int16 preserves the unsigned bit arrangement`() {

        let value: Int16 = -100
        #expect(value.rotatedRight(by: 3) == Int16(bitPattern: 0x9FF3))
    }
}
