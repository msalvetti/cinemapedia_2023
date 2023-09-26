import '../entities/movie.dart';

/**
el repositorio es quien me permite cambiar de datasource.
Es la clase "que se usa en el resto de la app".
    API KEY cbef97d17a66c8483786a70d9861078a

**/
abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});
}
