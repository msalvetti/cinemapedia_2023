import 'package:cinemapedia_2023/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_2023/domain/entities/actor.dart';
import 'package:cinemapedia_2023/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia_2023/infraestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Environment.theMovieDeKey,
        'languague': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    if (response.statusCode != 200) {
      throw Exception("Actors of Movie with id: $movieId not found");
    }

    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
