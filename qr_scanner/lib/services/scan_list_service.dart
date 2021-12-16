import 'package:flutter/material.dart';
import 'package:qr_scanner/services/db_service.dart';

class ScanListService extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';
  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBService.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBService.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBService.db.getScansByTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBService.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBService.db.deleteScan(id);
    // this.cargarScanPorTipo(this.tipoSeleccionado);
  }
}
