import 'package:dartz/dartz.dart';

void main() {
  final Either<String, int> success = right(42);
  final Either<String, int> failure = left('Error');

  // Fold handles both cases
  success.fold(
    (error) => print('Failure: $error'),
    (value) => print('Success: $value'), // Prints "Success: 42"
  );

  // Safe access with checks
  if (failure.isLeft()) {
    print(failure.left); // Prints "Error"
  }

  try {
    print(success.left); // Throws StateError
  } catch (e) {
    print(e); // Handle error appropriately
  }
}
