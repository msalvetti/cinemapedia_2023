import 'package:cinemapedia_2023/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infraestructure/repositories/actor_repository_impl.dart';

// Este repositorio es inmutable
final actorsRepositoryProvider = Provider(((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
}));
