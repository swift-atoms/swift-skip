@frozen
public struct Skip<Kept: ~Copyable & ~Escapable, Dropped: ~Copyable & ~Escapable> {

    @inlinable
    public init() {}
}

extension Skip where Kept: ~Copyable & ~Escapable, Dropped: ~Copyable & ~Escapable {
    @inlinable
    @_lifetime(copy kept)
    public borrowing func callAsFunction(
        _ kept: consuming Kept,
        _ dropped: consuming Dropped
    ) -> Kept {
        kept
    }
}
