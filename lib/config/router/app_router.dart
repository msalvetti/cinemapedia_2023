import 'package:cinemapedia_2023/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: "/",
    name: HomeScreen.name,
    builder: (context, state) => HomeScreen(),
  ),
//  GoRoute(path: "/", name: HomeScreen.name, builder: ),
]);
