import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../../models/response/anime_response.dart';
part 'api_repository.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class AnimeAPiServices {
  factory AnimeAPiServices(Dio dio, {String baseUrl}) = _AnimeAPiServices;

  @GET('/anime')
  Future<HttpResponse<AnimeResponse>> getAnime({
    @Query("q") String? q,
    @Query("page") int? page,
    @Query("limit") int? limit,
  });
}
