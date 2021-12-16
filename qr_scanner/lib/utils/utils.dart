import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  // final url = scan.valor;
  // if (scan.tipo == 'http') {
  //   await canLaunch(url!) ? await launch(url) : throw 'Could not launch $url';
  // } else {
  //   Navigator.pushNamed(context, 'mapa', arguments: scan);
  // }
  final url = scan.valor;
  if (scan.tipo == 'http') {
    !await canLaunch(url!) ? await launch(url) : throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
