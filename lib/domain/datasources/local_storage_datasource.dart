import '../entities/movie.dart';

/**
 * voy a crear una clase abstracta Datasource
 * para conectarme a la DB Isar.
 *
 */

abstract class LocalStorageDataSource {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0});
}
