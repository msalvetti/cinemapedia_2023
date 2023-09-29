import 'package:cinemapedia_2023/domain/entities/movie.dart';
import 'package:cinemapedia_2023/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    //cache local
    ref
        .read(movieInfoProvider.notifier)
        .loadMovie(widget.movieId); //esto hace request
    // los widgets llaman a los providers, no el repositorio directo
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(movieInfoProvider);
    final Movie? movie = movies[widget.movieId];

    if (movie == null) {
      return Scaffold(
          body: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'),
      ),
    );
  }
}
