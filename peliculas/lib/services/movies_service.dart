import 'dart:async';
import 'dart:convert';

import 'package:cartas/bloc/bloc.dart';
import 'package:cartas/bloc/modelos/search_response.dart';
import 'package:cartas/helpers/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieService extends ChangeNotifier {
  String _apikey = '472b3f9f5d461cb7c89998be7ac3abc7';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Movie> _populares = [];

  final _popularesStreamController = StreamController<List<Movie>>.broadcast();

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestionStreamController =
      new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      this._suggestionStreamController.stream;

  Function(List<Movie>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Movie>> get popularesStream => _popularesStreamController.stream;

  void Dispose() {
    _popularesStreamController.close();
  }

  Future<List<Movie>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    return await _procesarRespuesta(url);
  }

  Future<List<Movie>> getPopulares() async {
    _popularesPage++;

    if (_cargando) return [];

    _cargando = true;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);

    popularesSink(_populares);
    _cargando = false;

    return resp;
  }

  Future<List<Movie>> _procesarRespuesta(Uri url) async {
    final res = await http.get(url);
    final decodedData = json.decode(res.body);

    final peliculas = new Movies.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apikey,
      'language': _language,
      'query': query,
    });

    final resp = await _procesarRespuesta(url);
    return resp;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      // print('tenemos valor a buscar:$value');
      final results = await this.searchMovies(value);
      this._suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
