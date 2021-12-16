import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/services/services.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles('http');
  }
}
