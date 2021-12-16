import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/bloc/bloc.dart';
import 'package:qr_scanner/pages/mapas_page.dart';
import 'package:qr_scanner/services/services.dart';
import 'package:qr_scanner/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

import 'direcciones_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MapasBloc _mapasBloc;
  var currentIndex = 0;

  @override
  void initState() {
    _mapasBloc = new MapasBloc(InitialMapasState());
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    // final uiService = new UiService();
    final scanListService =
        Provider.of<ScanListService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: () => scanListService.borrarTodos(),
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: navigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget navigationBar() {
    final uiService = Provider.of<UiService>(context);
    return BottomNavigationBar(
      onTap: (int i) => uiService.selectedMenuOpt = i,
      currentIndex: uiService.selectedMenuOpt,
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
      ],
    );
  }

  Widget HomePageBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiService = Provider.of<UiService>(context);
    final currentIndex = uiService.selectedMenuOpt;
    final scanListService =
        Provider.of<ScanListService>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListService.cargarScanPorTipo('geo');
        return MapasPage();
      case 1:
        scanListService.cargarScanPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
