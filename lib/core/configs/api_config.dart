import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pearlway/core/auth/auth_datasources.dart';
import 'package:pearlway/core/constants/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class ApiBaseRequests {
  final Dio _dio;
  final AuthDataSources _authDataSources = AuthDataSources();
  final String baseUrl;

  ApiBaseRequests({required this.baseUrl, Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl)) {
    _dio.options.headers = {'Accept': 'application/json'};

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final auth = GetIt.instance<AuthDataSources>();
          String? token = auth.getToken();
          if (token != null) {
            options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            await _redirectToLogin();
          }
          return handler.next(error);
        },
      ),
    );

    debugPrint(
      "ðŸš€ ApiBaseRequests Initialized with Base URL: $baseUrl",
    ); // Debugging

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(responseBody: true, error: true));
    }
  }

  String getBaseUrl() {
    return baseUrl;
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(uri, queryParameters: queryParameters);
      return _handleResponse(response);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String uri, {dynamic data}) async {
    try {
      var response = await _dio.post(uri, data: data);
      return _handleResponse(response);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(String uri, {dynamic data}) async {
    try {
      var response = await _dio.put(uri, data: data);
      return _handleResponse(response);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String uri, {dynamic data}) async {
    try {
      var response = await _dio.delete(uri, data: data);
      return _handleResponse(response);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  dynamic _handleResponse(Response response) {
    return response.data;
  }

  Future<void> _redirectToLogin() async {
    await _authDataSources.clearAll();
    NavigationHelper.router.refresh();
  }
}
