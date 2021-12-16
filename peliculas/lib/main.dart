import 'package:cartas/bloc/peliculas/pelicula_bloc.dart';
import 'package:cartas/services/movies_service.dart';
import 'package:flutter/material.dart';

import 'screens/add_screen.dart';
import 'screens/screens.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());
// void main() => runApp(AppState());

// class AppState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifier(
//           create: (_) => MovieService(),
//         ),
//       ],
//       child: MyApp(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cartas',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Colors.blue),
      ),
    );
  }
}
