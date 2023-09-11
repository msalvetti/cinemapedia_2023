import 'package:cinemapedia_2023/domain/entities/movie.dart';

import '../../domain/datasources/movies_datasource.dart';
import '../../domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
