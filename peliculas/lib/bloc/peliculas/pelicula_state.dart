// part of 'peliculas/pelicula_bloc.dart';

import 'package:cartas/bloc/bloc.dart';
import 'package:cartas/bloc/modelos/pelicula.dart';
import 'package:equatable/equatable.dart';

enum MovieStatus { initial, success, failure }

abstract class MovieState extends Equatable {
  const MovieState();
  // @override
  // TODO: implement props
  // List<Object?> get props => [];
  // const MovieState({
  //   this.status = MovieStatus.initial,
  //   this.peliculas = const <Movie>[],
  //   this.hasReachedMax = false,
  // });

  // final MovieStatus status;
  // final List<Movie> peliculas;
  // final bool hasReachedMax;

  // MovieState copyWith({
  //   MovieStatus? status,
  //   List<Movie>? peliculas,
  //   bool? hasReachedMax,
  // }) {
  //   return MovieState(
  //     status: status ?? this.status,
  //     peliculas: peliculas ?? this.peliculas,
  //     hasReachedMax: hasReachedMax ?? this.hasReachedMax,
  //   );
  // }

  // @override
  // String toString() {
  //   return '''PostState { status: $status, hasReachedMax: $hasReachedMax, peliculas: ${peliculas.length} }''';
  // }

  // @override
  // List<Object> get props => [status, peliculas, hasReachedMax];

}

class InitialMovieState extends MovieState {
  InitialMovieState();
  @override
  List<Object?> get props => [];
}

class LoaderMovies extends MovieState {
  final List<Movie> enCines;
  LoaderMovies(this.enCines);
  @override
  List<Object> get props => [this.enCines];
}
