# Bit Pattern

Bit Pattern owns operations on finite unsigned bit representations: masks, set/unset positions, ranks, selection, and rotation. Rotation is a bit permutation, not arithmetic scaling. Counts are reduced modulo the actual bit width; negative counts reverse direction. Swift FixedWidthInteger adapters reinterpret signed operands through their unsigned magnitude type so that the sign bit rotates without sign extension.

Import `Bit_Pattern` for `rotatedLeft(by:)` and `rotatedRight(by:)`. Rounded arithmetic shifting belongs to Integer and Rounding.
