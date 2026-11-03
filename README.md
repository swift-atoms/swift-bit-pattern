# swift-bit-pattern

Use this package when you work on the bits of a single fixed-width unsigned word: building masks, finding, counting or visiting set and clear bit positions, or rotating an integer. Start from `Bit.Pattern<Carrier>.Mask`, `Bit.Pattern<Carrier>.Ones` and `Bit.Pattern<Carrier>.Zeros`; rotation is on every `Swift.FixedWidthInteger`, and `Bit.Order` names the most- or least-significant-first convention. For a single bit value use `Bit` from `swift-bit`; for a set of positions that can span more than one word use swift-bitset.

## Laws

- Positions count from the least significant bit: position 0 is the bit worth 1, position `bitWidth - 1` the most significant. This holds whatever `Bit.Order` a caller works in; `Bit.Pattern` never consults it.
- `Bit.Pattern<Carrier>.Mask.lowBits(_:)` and `highBits(_:)` select the `n` lowest or highest positions; `n` of zero gives `zero`, `n` at or beyond the bit width gives `allOnes`, and a negative `n` traps. `bit(_:)` traps for a position outside `0 ..< bitWidth`.
- Mask operators are the set operations on positions: `|` is union, `&` intersection, `^` symmetric difference and `~` complement, so `~lowBits(k) == highBits(bitWidth - k)`. `contains(_:)` is superset (every mask contains `zero`); `intersects(_:)` is a non-empty intersection. A mask's `description` is `0x` followed by uppercase hexadecimal without leading zeros.
- `Bit.Pattern<Carrier>.Zeros(word)` behaves exactly as `Bit.Pattern<Carrier>.Ones(~word)`, except that `rank(below:)` counts within the word only.
- `first` and `last` are the lowest and highest matching position, or `nil` when there is none.
- `rank(below: p)` counts matching positions strictly below `p`; a `p` of zero or less gives 0 and a `p` at or beyond the bit width counts the whole word. For every `p` in `0 ... bitWidth`, the ones rank plus the zeros rank equals `p`.
- `select(n)` is the position of the `n`th matching bit counting from zero, lowest first; it is `nil` for a negative `n` or when fewer than `n + 1` bits match.
- `forEach(_:)` visits matching positions in ascending order, lowest first.
- `rotatedLeft(by:)` and `rotatedRight(by:)` take the count modulo the bit width, so rotating by zero or by the bit width is the identity, a negative count rotates the other way, and rotating one way then the other by the same count recovers the value. Signed integers rotate their two's-complement bit pattern unchanged; the sign bit is not treated specially.
- `Bit.Order.opposite` swaps `msb` and `lsb` and is its own inverse. Case order is `msb` then `lsb`, both in `allCases` and, with the Finite trait, in `ordinal` (0 and 1).
