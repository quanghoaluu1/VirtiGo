import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api_url.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    // Interceptor: log + gắn token
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final storage = GetStorage();
        final token = storage.read("token");

        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }

        print("➡️ [${options.method}] ${options.uri}");
        print("Headers: ${options.headers}");
        print("Data: ${options.data}");

        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("✅ RESPONSE[${response.statusCode}] => ${response.data}");
        return handler.next(response);
      },
      onError: (e, handler) {
        print("❌ ERROR[${e.response?.statusCode}] => ${e.message}");
        return handler.next(e);
      },
    ));
  }
}