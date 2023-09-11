import 'package:cinemapedia_2023/config/constants/environment.dart';
import 'package:cinemapedia_2023/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_2023/domain/entities/movie.dart';
import 'package:cinemapedia_2023/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_2023/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Environment.theMovieDeKey,
        'languague': 'es-MX'
      }));

//https://api.themoviedb.org/3/movie/157336?api_key=cbef97d17a66c8483786a70d9861078a&append_to_response=videos,images

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }
}
