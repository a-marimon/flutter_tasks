import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_tasks/data/api/intercetors/headers.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/domain/entity/entity.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

class Paths {
  static const counter = "/counter/";
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

@RestApi(baseUrl: kApiUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(Paths.counter)
  Future<PaginatorResponse<CounterEntity>> counters(
    @Query("name") String name,
    @Default(0) @Query("offset") int? offset,
    @Default(10) @Query("limit") int? limit,
  );

  @GET('${Paths.counter}last/{name}/')
  Future<CounterEntity> lastCounter(
    @Path("name") String name,
  );

  @GET('${Paths.counter}dashboard/')
  Future<List<DashEntity>> dashboard();

  @POST(Paths.counter)
  Future<CounterEntity> addCounter({
    @Field() String? name,
    @Field() String? operation,
    @Field() int? current,
  });
}
