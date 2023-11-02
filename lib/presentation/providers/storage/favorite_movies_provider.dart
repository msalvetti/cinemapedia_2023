import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/repositories/local_storage_repository.dart';
import 'local_storage_provider.dart';

/// Es un contenedor en memoria de las peliculas que estan en favoritos.
/// vamos a crear un StateNotifiesProvider para manejar el estado de la pelicula
/// que está como favorita y la paginacion infinita, de a 10.
/// si no hay nada, regresamos vacio.

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>(
  (ref) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return StorageMoviesNotifier(
        localStorageRepository: localStorageRepository);
  },
);

/*
La estructura serà asi:
{
  1234: Movie,
  1221: Movie,
  9395: Movie
}
 */
class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;

  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  /**
   * Regresamos una lista de Movie
   * vamos a cargar las peliculas favoritas con paginacion (limite y offset)
   */
  Future<List<Movie>> loadNextPage() async {
    final movies =
        await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;

    final tempMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
