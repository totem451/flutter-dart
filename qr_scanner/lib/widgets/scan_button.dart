import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/services/services.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          print(barcodeScanRes);

          // final barcodeScanRes = 'https://www.google.com/';
          // final barcodeScanRes = 'geo:-31.466344,-64.423625';
          if (barcodeScanRes == '-1') {
            return;
          }
          final scanListService =
              Provider.of<ScanListService>(context, listen: false);
          // scanListService.nuevoScan(barcodeScanRes);
          final nuevoScan = await scanListService.nuevoScan(barcodeScanRes);
          launchURL(context, nuevoScan);
        });
  }
}
