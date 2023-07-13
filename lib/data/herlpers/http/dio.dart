import 'package:dio/dio.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/device/herlpers/device/device.dart';

class HeadersInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['content-type'] = 'application/json';
    options.headers['device-id'] = await DeviceInfoImpl.deviceId;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}

class DioHttpHelper {
  static Dio? _client;

  static Dio client({bool free = false}) {
    if (_client != null) return _client!;
    Dio http = Dio();
    http.interceptors.clear();
    http.interceptors.add(HeadersInterceptor());
    http.options.baseUrl = kApiUrl;
    _client = http;
    return _client!;
  }
}
