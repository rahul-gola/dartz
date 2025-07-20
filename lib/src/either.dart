/// Represents which side of an [Either] value.
enum Side { left, right }

/// A union type containing either a left value [L] or a right value [R].
typedef Either<L, R> = (Side side, Object? value);

/// Creates a left value of type [L] for an [Either].
Either<L, R> left<L, R>(L value) => (Side.left, value);

/// Creates a right value of type [R] for an [Either].
Either<L, R> right<L, R>(R value) => (Side.right, value);

/// Extension providing utility methods for [Either] values.
extension EitherExtension<L, R> on Either<L, R> {
  /// Applies [onLeft] if this is a left value, [onRight] if this is a right value.
  void fold(void Function(L) onLeft, void Function(R) onRight) {
    final (side, value) = this; // Correct destructuring here

    switch (side) {
      case Side.left:
        onLeft(value as L);
        break;
      case Side.right:
        onRight(value as R);
        break;
    }
  }

  /// Returns true if this is a left value.
  bool isLeft() => this.$1 == Side.left; // Accessing the side via $1

  /// Returns true if this is a right value.
  bool isRight() => this.$1 == Side.right; // Accessing the side via $1

  /// Gets the left value if present, otherwise throws a [StateError].
  L get left {
    if (isLeft()) return this.$2 as L; // Return value as L if it's left
    throw StateError('Cannot access left value of Right either');
  }

  /// Gets the right value if present, otherwise throws a [StateError].
  R get right {
    if (isRight()) return this.$2 as R; // Return value as R if it's right
    throw StateError('Cannot access right value of Left either');
  }
}
