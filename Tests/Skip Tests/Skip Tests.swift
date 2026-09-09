import Skip
import Testing

@Suite
struct `Skip discards values independently of parsing` {

    @Test
    func `a scoped value is retained and a linear value is destroyed`() {
        let lifetime = Lifetime()
        let skip = Skip::Skip<Span<Int>, Token>()
        let values = [42]
        let result = skip(values.span, Token(lifetime: lifetime))
        #expect(result[0] == 42)
        #expect(lifetime.destroyed == 1)
    }

    private final class Lifetime { var destroyed = 0 }
    private struct Token: ~Copyable {
        let lifetime: Lifetime
        deinit { lifetime.destroyed += 1 }
    }
}
