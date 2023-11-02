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
    final movies = await localStorageRepository.loadMovies(
      limit: 10,
      offset: page * 10,
    );
    page++;
    state = {
      ...state,
      for (final movie in movies) movie.id: movie,
    };
    return movies;
  }
}
