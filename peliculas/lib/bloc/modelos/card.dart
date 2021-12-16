// To parse this JSON data, do
//
//     final cards = cardsFromJson(jsonString);

import 'dart:convert';

List<Card> cardsFromJson(String str) =>
    List<Card>.from(json.decode(str).map((x) => Card.fromJson(x)));

String cardsToJson(List<Card> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Card {
  Card({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.foto,
    required this.rareza,
    required this.posicion,
    required this.equipo,
    required this.serie,
  });

  int id;
  String nombre;
  String apellido;
  String foto;
  String rareza;
  String posicion;
  String equipo;
  String serie;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        foto: json["foto"],
        rareza: json["rareza"],
        posicion: json["posicion"],
        equipo: json["equipo"],
        serie: json["serie"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "foto": foto,
        "rareza": rareza,
        "posicion": posicion,
        "equipo": equipo,
        "serie": serie,
      };

  getImg() {
    if (foto == null) {
      return 'https://justynsmith.com/wp-content/themes/cruzy-pro/images/no-image-box.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$foto';
    }
  }
}

class Cards {
  List<Card> items = [];

  Cards();

  Cards.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final card = new Card.fromJson(item);
      items.add(card);
    }
  }
}
