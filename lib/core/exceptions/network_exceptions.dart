import 'dart:io';

import 'package:dio/dio.dart';

class NetworkExceptions {
  final String? message;
  final int? statusCode;
  final ErrorException? errorModel;

  const NetworkExceptions({
    this.message,
    this.statusCode,
    this.errorModel,
  });

  factory NetworkExceptions.requestCancelled() => const RequestCancelled();

  factory NetworkExceptions.unauthorizedRequest(String reason) =>
      UnauthorizedRequest(reason);

  factory NetworkExceptions.badRequest(ErrorException? errorModel) =>
      BadRequest(errorModel);

  factory NetworkExceptions.notFound(String reason) => NotFound(reason);

  factory NetworkExceptions.methodNotAllowed() => const MethodNotAllowed();

  factory NetworkExceptions.notAcceptable() => const NotAcceptable();

  factory NetworkExceptions.requestTimeout() => const RequestTimeout();

  factory NetworkExceptions.sendTimeout() => const SendTimeout();

  factory NetworkExceptions.conflict(ErrorException? errorModel) =>
      Conflict(errorModel);

  factory NetworkExceptions.internalServerError() =>
      const InternalServerError();

  factory NetworkExceptions.notImplemented() => const NotImplemented();

  factory NetworkExceptions.serviceUnavailable() => const ServiceUnavailable();

  factory NetworkExceptions.noInternetConnection() =>
      const NoInternetConnection();

  factory NetworkExceptions.formatException() => const FormatException();

  factory NetworkExceptions.unableToProcess() => const UnableToProcess();

  factory NetworkExceptions.defaultError(String error) => DefaultError(error);

  factory NetworkExceptions.unexpectedError() => const UnexpectedError();

  static NetworkExceptions handleResponse(Response? response) {
    ErrorException? errorModel;
    errorModel = ErrorException(
      error: response?.data['result'] is String
          ? {'error': response?.data['result']}
          : response?.data['result'],
      statusMessage: response?.data['message'],
      code: response?.statusCode ?? 0,
    );

    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
        return NetworkExceptions.notFound(
            errorModel.statusMessage ?? "No Permission Login to Continue");
      case 403:
        return NetworkExceptions.unauthorizedRequest(
            errorModel.statusMessage ?? "Not found");
      case 404:
        return NetworkExceptions.notFound(
            errorModel.statusMessage ?? "Not found");
      case 409:
        errorModel.data = response?.data['data'];
        return NetworkExceptions.conflict(errorModel);
      case 408:
        return NetworkExceptions.requestTimeout();
      case 422:
      case 417:
        return NetworkExceptions.badRequest(errorModel);
      case 500:
        return NetworkExceptions.internalServerError();
      case 503:
        return NetworkExceptions.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getDioException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionError:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return NetworkExceptions.formatException();
      } catch (_) {
        return NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.unexpectedError();
      }
    }
  }

  static ErrorException getErrorMessage(NetworkExceptions networkExceptions) {
    ErrorException errorModel = ErrorException(statusMessage: '', code: 0);
    if (networkExceptions is NotImplemented) {
      errorModel = ErrorException(statusMessage: "Not Implemented", code: 0);
    } else if (networkExceptions is RequestCancelled) {
      errorModel = ErrorException(statusMessage: "Request Cancelled", code: 2);
    } else if (networkExceptions is InternalServerError) {
      errorModel =
          ErrorException(statusMessage: "Internal Server Error", code: 500);
    } else if (networkExceptions is NotFound) {
      errorModel =
          ErrorException(statusMessage: networkExceptions.reason, code: 404);
    } else if (networkExceptions is ServiceUnavailable) {
      errorModel =
          ErrorException(statusMessage: "Service unavailable", code: 503);
    } else if (networkExceptions is MethodNotAllowed) {
      errorModel = ErrorException(statusMessage: "Method Allowed", code: 405);
    } else if (networkExceptions is BadRequest) {
      errorModel = networkExceptions.errorModel!;
    } else if (networkExceptions is UnauthorizedRequest) {
      errorModel =
          ErrorException(statusMessage: networkExceptions.reason, code: 403);
    } else if (networkExceptions is UnexpectedError) {
      errorModel =
          ErrorException(statusMessage: "Unexpected error occurred", code: 0);
    } else if (networkExceptions is RequestTimeout) {
      errorModel = ErrorException(
          statusMessage: "Connection request timeout", code: 408);
    } else if (networkExceptions is NoInternetConnection) {
      errorModel =
          ErrorException(statusMessage: "No internet connection", code: 502);
    } else if (networkExceptions is Conflict) {
      errorModel = networkExceptions.errorModel!;
    } else if (networkExceptions is SendTimeout) {
      errorModel = ErrorException(
          statusMessage: "Send timeout in connection with API server",
          code: 408);
    } else if (networkExceptions is UnableToProcess) {
      errorModel =
          ErrorException(statusMessage: "Unable to process the data", code: 0);
    } else if (networkExceptions is DefaultError) {
      errorModel =
          ErrorException(statusMessage: networkExceptions.error, code: 0);
    } else if (networkExceptions is FormatException) {
      errorModel =
          ErrorException(statusMessage: "Unexpected error occurred", code: 0);
    } else if (networkExceptions is NotAcceptable) {
      errorModel = ErrorException(statusMessage: "Not acceptable", code: 0);
    }
    return errorModel;
  }
}

class RequestCancelled extends NetworkExceptions {
  const RequestCancelled() : super();
}

class UnauthorizedRequest extends NetworkExceptions {
  final String reason;

  const UnauthorizedRequest(this.reason) : super(message: reason);
}

class BadRequest extends NetworkExceptions {
  const BadRequest(ErrorException? errorModel) : super(errorModel: errorModel);
}

class NotFound extends NetworkExceptions {
  final String reason;

  const NotFound(this.reason) : super(message: reason);
}

class MethodNotAllowed extends NetworkExceptions {
  const MethodNotAllowed() : super();
}

class NotAcceptable extends NetworkExceptions {
  const NotAcceptable() : super();
}

class RequestTimeout extends NetworkExceptions {
  const RequestTimeout() : super();
}

class SendTimeout extends NetworkExceptions {
  const SendTimeout() : super();
}

class Conflict extends NetworkExceptions {
  const Conflict(ErrorException? errorModel) : super(errorModel: errorModel);
}

class InternalServerError extends NetworkExceptions {
  const InternalServerError() : super();
}

class NotImplemented extends NetworkExceptions {
  const NotImplemented() : super();
}

class ServiceUnavailable extends NetworkExceptions {
  const ServiceUnavailable() : super();
}

class NoInternetConnection extends NetworkExceptions {
  const NoInternetConnection() : super();
}

class FormatException extends NetworkExceptions {
  const FormatException() : super();
}

class UnableToProcess extends NetworkExceptions {
  const UnableToProcess() : super();
}

class DefaultError extends NetworkExceptions {
  final String error;

  const DefaultError(this.error) : super(message: error);
}

class UnexpectedError extends NetworkExceptions {
  const UnexpectedError() : super();
}

class ErrorException {
  String? statusMessage;
  Map? error;
  String? errorText;
  dynamic data;
  int? code;

  ErrorException({
    this.statusMessage,
    this.error,
    this.errorText,
    this.data,
    this.code,
  });
}
