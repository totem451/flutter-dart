import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
export 'package:qr_scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static Database? _database;
  static final DBService db = DBService._();
  DBService._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
    });
  }

  nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    final res = await db.rawInsert('''
      INSERT INTO Scans(id, tipo, valor)
        VALUES($id, '$tipo', '$valor')
    ''');
    return res;
  }

  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    print(res);
    return res;
  }

  getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  getScansByTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }
}
