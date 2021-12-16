import 'package:bloc/bloc.dart';
import 'package:cartas/services/cards_service.dart';
import 'package:cartas/services/movies_service.dart';
import 'package:http/http.dart' as http;
import '../bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(InitialMovieState()) {
    /// TODO: register on<PostFetched> event
  }
  final _movieService = new MovieService();
  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is GetMovies) {
      final respEnCines = await _movieService.getEnCines();
      if (respEnCines != []) {
        yield LoaderMovies(respEnCines);
      } else {
        print('No hay peliculas en cartelera');
      }
    }

    if (event is MovieFetched) {}
  }
}
