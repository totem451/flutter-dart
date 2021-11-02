import 'package:cartas/screens/add_screen.dart';
import 'package:cartas/search/search_delegate.dart';
import 'package:cartas/services/movies_service.dart';
import 'package:cartas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieBloc _movieBloc;
  final movieService = new MovieService();
  @override
  void initState() {
    _movieBloc = new MovieBloc();
    _movieBloc.add(GetMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    movieService.getPopulares();
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Peliculas'),
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: Icon(Icons.search_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          BlocListener<MovieBloc, MovieState>(
            bloc: _movieBloc,
            listener: (context, state) {
              // if (state is InitialMovieState) {
              //   return Container(
              //       height: 400,
              //       child: Center(child: CircularProgressIndicator()));
              // }
            },
            child: BlocBuilder<MovieBloc, MovieState>(
              bloc: _movieBloc,
              builder: (context, state) {
                if (state is InitialMovieState) {
                  return Container(
                      height: 400,
                      child: Center(child: CircularProgressIndicator()));
                }
                if (state is LoaderMovies) {
                  return Column(
                    children: [
                      // Tarjetas principales
                      CardSwiper(peliculas: state.enCines),
                      // Slider de cartas
                      // StreamBuilder(
                      //   stream: movieService.popularesStream,
                      //   builder:
                      //       (BuildContext context, AsyncSnapshot snapshot) {
                      //     if (snapshot.hasData) {
                      //       return CardSlider(
                      //           peliculas: snapshot.data,
                      //           onNextPage: movieService.getPopulares);
                      //     } else {
                      //       return Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // FloatingActionButton(
                      //   onPressed: () {},
                      //   backgroundColor: Colors.blue,
                      //   child: Icon(Icons.add),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ])));
  }

  Widget _loading() => Text('loading...');
}
