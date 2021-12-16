import 'package:built_value/built_value.dart';
import 'package:equatable/equatable.dart';

abstract class MapasEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigateToPage extends MapasEvent {
  final int currentPageIndex;
  NavigateToPage(this.currentPageIndex);
  List<Object> get props => [this.currentPageIndex];
}
