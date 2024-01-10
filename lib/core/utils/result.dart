import 'package:clase_clean_architecture/core/errors/failure.dart';

/// A [Result] is a type that represents either a success or a [Failure].
typedef Result<T> = ({T? success, Failure? failure});

/// A [FutureResult] is a type that represents a [Future] of a [Result].
typedef FutureResult<T> = Future<Result<T>>;

/// A [StreamResult] is a type that represents a [Stream] of a [Result].
typedef StreamResult<T> = Stream<Result<T>>;

/// A [ResultVoid] is a type that represents either a void success
/// or a [Failure].
typedef ResultVoid = Result<void>;

/// A [FutureResultVoid] is a type that represents a [Future] of a [ResultVoid].
typedef FutureResultVoid = Future<ResultVoid>;

const voidSuccess = (success: null, failure: null);

Result<T> right<T>(T param) => (success: param, failure: null);

Result<T> left<T>(Failure param) => (success: null, failure: param);

extension Fold<T> on Result<T> {
  /// Takes two functions as arguments. The first function is called if the
  /// [Result] is a success or both the success and failure are null,
  /// the second function is called if the [Result] is a
  /// failure.
  ///
  /// Returns the value returned by the function that was called.
  B fold<B>(
    B Function(T? success) ifSuccess,
    B Function(Failure failure) ifFailure,
  ) {
    if (success != null) {
      return ifSuccess(success as T);
    } else if (failure != null) {
      return ifFailure(failure!);
    } else {
      return ifSuccess(null);
    }
  }

  /// Returns true if the [Failure] is null, false otherwise.
  bool get isSuccess => failure == null;

  /// Returns true if the [Result] is a failure, false otherwise.
  bool get isFailure => failure != null;

  /// Takes a function as an argument. The function is called if the [Result] is
  /// a success.
  void ifSuccess(void Function(T? success) ifSuccess) {
    if (isSuccess) {
      ifSuccess(success);
    }
  }

  /// Takes a function as an argument. The function is called if the [Result] is
  /// a failure.
  void ifFailure(void Function(Failure failure) ifFailure) {
    if (isFailure) {
      ifFailure(failure!);
    }
  }
}
