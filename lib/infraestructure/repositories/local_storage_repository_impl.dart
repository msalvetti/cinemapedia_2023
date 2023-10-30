import 'package:cinemapedia_2023/domain/entities/movie.dart';

import '../../domain/datasources/local_storage_datasource.dart';
import '../../domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorageDataSource datasource;

  LocalStorageRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorites(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}
