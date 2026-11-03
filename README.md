# swift-skip

Use this package when you have two values, need to keep one and throw the other away, and the types may be noncopyable or nonescapable. Start from `Skip<Kept, Dropped>`. It is a plain value with no parsing or coding in it. To skip input while parsing, use the Skip parser in swift-parser. To skip a part while coding, use the Skip coder in swift-coder. Both extend this type.

## Laws

- Calling a `Skip<Kept, Dropped>` returns `kept` exactly as it was passed in. The value is not copied or rebuilt, so a borrowed view such as `Span<Int>` still sees the same storage.
- `dropped` is destroyed before the call returns. Its deinitializer runs exactly once, and nothing about it is kept.
