import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/services/services.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles('geo');
  }
}

// @override
// Widget build(BuildContext context) {
//   return BlocBuilder<MapasBloc, MapasState>(
//     builder: (BuildContext context, MapasState state) {
//       return Container(
//         color: Colors.blue[900],
//         child: Center(child: CircularProgressIndicator()),
//       );
//     },
//   );
// }
