import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDeKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'no api key';
}
