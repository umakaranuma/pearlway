import 'network_exceptions.dart';

/// A generic class to handle API responses
class ApiResult<T> {
  final T? data;
  final NetworkExceptions? error;
  final bool isSuccess;

  /// Private constructor to ensure controlled instance creation
  const ApiResult._({this.data, this.error, required this.isSuccess});

  /// Factory constructor for a successful response
  factory ApiResult.success(T data) {
    return ApiResult._(data: data, isSuccess: true);
  }

  /// Factory constructor for a failed response
  factory ApiResult.failure(NetworkExceptions error) {
    return ApiResult._(error: error, isSuccess: false);
  }

  /// Returns true if the API call was successful
  bool get isSuccessful => isSuccess;

  /// Returns the API response data if successful, otherwise null
  T? get getData => data;

  /// Returns the error if the API call failed, otherwise null
  NetworkExceptions? get getError => error;

  /// Performs an action based on success or failure
  R when<R>({
    required R Function(T data) success,
    required R Function(NetworkExceptions error) failure,
  }) {
    if (isSuccess && data != null) {
      return success(data as T);
    } else if (!isSuccess && error != null) {
      return failure(error as NetworkExceptions);
    }
    throw Exception("Invalid ApiResult state");
  }
}
