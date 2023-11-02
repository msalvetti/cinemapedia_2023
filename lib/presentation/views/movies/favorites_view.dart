import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/storage/favorite_movies_provider.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  /*
    initState para traer las 10 primeras peliculas usando el
    favorite_movies_provider
  */
  @override
  void initState() {
    super.initState();
    // aca cargamos las peliculas iniciales
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    return Scaffold(
        body: ListView.builder(
            itemCount: favoriteMovies.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(favoriteMovies[index].title),
              );
            }));
  }
}
