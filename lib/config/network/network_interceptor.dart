import 'dart:developer';
import 'package:dio/dio.dart';

class NetworkInterceptor implements Interceptor {
  String? _accessToken;

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    log('❌ ❌ ❌ Dio Error!');
    log('❌ ❌ ❌ Url: ${err.requestOptions.uri}');
    log('❌ ❌ ❌ ${err.stackTrace}');
    log('❌ ❌ ❌ Response Errors: ${err.response?.data}');

    return handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    /// Logging:
    log('🌍 🌍 🌍 Retrieving request from network');
    log('Url: ${options.uri}');
    log('Params: ${options.queryParameters}');

    /// options.headers['Authorization'] = 'Bearer $_accessToken';

    // Continue with the request.
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log('🌍 🌍 🌍 Retrieved response from network');
    log('⬅️ ⬅️ ⬅️ Response');
    log('''<---- ${(response.statusCode != 200 || response.statusCode != 201) ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}''');
    log('Query params: ${response.requestOptions.queryParameters}');
    log('-------------------------');
    return handler.next(response);
  }
}
