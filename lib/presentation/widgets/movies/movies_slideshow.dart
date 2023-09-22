import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia_2023/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
        itemCount: movies.length,
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Placeholder();
  }
}
