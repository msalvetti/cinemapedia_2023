import 'package:cinemapedia_2023/domain/entities/actor.dart';
import 'package:cinemapedia_2023/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
  (ref) {
    final actorRepository = ref.watch(actorsRepositoryProvider);
    //ahora mando la referencia de la funcion al mapper.
    return ActorsByMovieNotifier(getActors: actorRepository.getActorsByMovie);
  },
);

/*
voy a crear un mapa con el id de la pelicula, que apunta a
un listado de actores
{
  '501231': <Actors>(),
  '501121': <Actors>(),
  '501641': <Actors>(),
}
 */
typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
