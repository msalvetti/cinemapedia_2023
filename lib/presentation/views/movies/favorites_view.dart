import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

    if (favoriteMovies.isEmpty) {
      final myColors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.favorite_outline_sharp,
                  size: 60, color: myColors.primary),
              Text('No hay peliculas favoritas',
                  style: TextStyle(fontSize: 30, color: myColors.primary)),
              const SizedBox(height: 20),
              FilledButton.tonal(
                child: const Text('Explorar'),
                onPressed: () => context.go('/home/0'),
              ),
            ]),
      );
    }

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
