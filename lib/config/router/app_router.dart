import 'package:cinemapedia_2023/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';
        //validate that pageIndex is a number greater than 0 and less than 3
        if (int.parse(pageIndex) < 0 || int.parse(pageIndex) > 2) {
          return const Center(
            child: Text(
              'Page not found',
              style: TextStyle(fontSize: 60),
            ),
          );
        }

        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
      ]),
  GoRoute(path: '/', redirect: (_, __) => '/home/0')
]);
