import 'package:cinemapedia_2023/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_2023/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider(((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
}));
