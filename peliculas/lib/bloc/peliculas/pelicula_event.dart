// part of 'peliculas/pelicula_bloc.dart';

import 'package:equatable/equatable.dart';
import '../modelos/pelicula.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMovies extends MovieEvent {
  GetMovies();
  List<Object> get props => [];
}

class MovieFetched extends MovieEvent {
  final Movie pelicula;
  MovieFetched(this.pelicula);
  List<Object> get props => [this.pelicula];
}
