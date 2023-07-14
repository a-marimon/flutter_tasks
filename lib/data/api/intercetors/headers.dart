import 'package:dio/dio.dart';
import 'package:my_tasks/device/info/device_info.dart';

class HeadersInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['content-type'] = 'application/json';
    options.headers['device-id'] = await DeviceInfo.deviceId;
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
