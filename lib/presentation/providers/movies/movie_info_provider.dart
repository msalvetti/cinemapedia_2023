import 'package:cinemapedia_2023/domain/entities/movie.dart';
import 'package:cinemapedia_2023/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>(
  (ref) {
    final movieRepository = ref.watch(movieRepositoryProvider);
    //ahora mando la referencia de la funcion al mapper.
    return MovieMapNotifier(getMovie: movieRepository.getMovieById);
  },
);

/*
voy a crear un mapa con el id de la pelicula, que apunta a
una instancia de movie
{
  '501231': Movie(),
  '501121': Movie(),
  '501641': Movie(),
}
 */
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    print("realizando request");
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
