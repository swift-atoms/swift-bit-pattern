public import Bit

extension Swift.FixedWidthInteger {

    @inlinable
    public func rotatedLeft(by count: Int) -> Self {
        Self(truncatingIfNeeded: Bit.Pattern<Magnitude>.rotatedLeft(Magnitude(truncatingIfNeeded: self), by: count))
    }

    @inlinable
    public func rotatedRight(by count: Int) -> Self {
        Self(truncatingIfNeeded: Bit.Pattern<Magnitude>.rotatedRight(Magnitude(truncatingIfNeeded: self), by: count))
    }
}
