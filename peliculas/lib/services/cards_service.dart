import 'dart:async';
import 'dart:convert';

import 'package:cartas/bloc/bloc.dart';
import 'package:cartas/bloc/modelos/search_response.dart';
import 'package:cartas/bloc/modelos/card.dart' as c;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardsService extends ChangeNotifier {
  String _apikey = '472b3f9f5d461cb7c89998be7ac3abc7';
  String _url = 'localhost:4000';
  String _language = 'es-ES';

  // int _popularesPage = 0;
  // bool _cargando = false;

  // List<c.Card> _populares = [];

  // final _popularesStreamController = StreamController<List<c.Card>>.broadcast();

  // Function(List<c.Card>) get popularesSink =>
  //     _popularesStreamController.sink.add;

  // Stream<List<c.Card>> get popularesStream => _popularesStreamController.stream;

  // void Dispose() {
  //   _popularesStreamController.close();
  // }

  Future<List<c.Card>> getCards() async {
    // final url = Uri.http('localhost:4000', '/cards');
    // return await _procesarRespuesta(url);
    final url = Uri.parse('http://192.168.5.103:4000/cards');
    final res = await http.get(url);
    final decodedData = json.decode(res.body);
    // print(decodedData);

    final cards = new c.Cards.fromJsonList(decodedData);
    return cards.items;
  }

  // Future<List<c.Card>> getPopulares() async {
  //   _popularesPage++;

  //   if (_cargando) return [];

  //   _cargando = true;

  //   final url = Uri.https(_url, '3/Card/popular', {
  //     'api_key': _apikey,
  //     'language': _language,
  //     'page': _popularesPage.toString()
  //   });

  //   final resp = await _procesarRespuesta(url);

  //   _populares.addAll(resp);

  //   popularesSink(_populares);
  //   _cargando = false;

  //   return resp;
  // }

  Future<List<c.Card>> _procesarRespuesta(Uri url) async {
    final res = await http.get(url);
    final decodedData = json.decode(res.body);

    final cards = new c.Cards.fromJsonList(decodedData['results']);

    return cards.items;
  }

  Future<List<c.Card>> searchCards(String query) async {
    final url = Uri.https(_url, '3/search/Card', {
      'api_key': _apikey,
      'language': _language,
      'query': query,
    });

    final resp = await _procesarRespuesta(url);
    return resp;
  }
}
