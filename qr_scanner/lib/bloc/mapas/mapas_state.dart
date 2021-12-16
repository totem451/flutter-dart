import 'package:equatable/equatable.dart';

abstract class MapasState extends Equatable {
  const MapasState();
}

class InitialMapasState extends MapasState {
  InitialMapasState();
  @override
  List<Object?> get props => [];
}

class NavigateToPageState extends MapasState {
  final int currentIndex;
  NavigateToPageState(this.currentIndex);
  @override
  List<Object?> get props => [this.currentIndex];
}
