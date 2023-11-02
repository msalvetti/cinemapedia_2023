import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/storage/favorite_movies_provider.dart';
import '../../widgets/movies/movie_masonry.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;
  int pageNumber = 0;
  bool error = false;

  @override
  void initState() {
    super.initState();

    isLastPage = false;
    isLoading = false;
    pageNumber = 0;
    error = false;
    // aca cargamos las peliculas iniciales
    loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    return MovieMasonry(movies: favoriteMovies, loadNextPage: loadNextPage);
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }
}
