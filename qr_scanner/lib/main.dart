import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/services/services.dart';
import 'package:qr_scanner/services/ui_service.dart';

import 'pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiService()),
        ChangeNotifierProvider(create: (_) => new ScanListService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
          'direcciones': (_) => DireccionesPage()
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
