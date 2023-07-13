import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/domain/entity/api/api_entity.dart';
import 'package:my_tasks/domain/entity/counter/counter_entity.dart';
import 'package:my_tasks/domain/entity/dash/dash_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

class Paths {
  static const counter = "/counter/";
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
