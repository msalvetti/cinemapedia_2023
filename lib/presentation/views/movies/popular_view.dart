import 'package:cinemapedia_2023/presentation/providers/providers.dart';
import 'package:cinemapedia_2023/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView> {
  // vamos a inicializar el estado
  @override
  void initState() {
    super.initState();

    // aca cargamos las peliculas iniciales
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return MovieMasonry(
      movies: ref.watch(popularMoviesProvider),
      loadNextPage: () {
        ref.read(popularMoviesProvider.notifier).loadNextPage();
      },
    );
  }
}
