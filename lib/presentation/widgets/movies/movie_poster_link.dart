import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_2023/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  const MoviePosterLink({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: () => context.push('/home/0/movie/${movie.id}'),
        child: ClipRRect(
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
