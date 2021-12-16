import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/pages/mapas_page.dart';
import '../bloc.dart';

class MapasBloc extends Bloc<MapasEvent, MapasState> {
  MapasBloc(MapasState initialState) : super(initialState);

  @override
  MapasState get initialState => throw UnimplementedError();

  @override
  Stream<MapasState> mapEventToState(MapasEvent event) async* {
    if (event is NavigateToPage) {
      switch (event.currentPageIndex) {
        case 0:
          yield NavigateToPageState(event.currentPageIndex);
          break;
        case 1:
          yield NavigateToPageState(event.currentPageIndex);
          break;
      }
    } else {
      print('error');
    }
  }
}
