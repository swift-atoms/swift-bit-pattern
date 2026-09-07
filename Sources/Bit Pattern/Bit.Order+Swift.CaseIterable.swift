public import Bit

extension Bit.Order: Swift.CaseIterable {

    public static var allCases: [Bit.Order] { [.msb, .lsb] }
}
