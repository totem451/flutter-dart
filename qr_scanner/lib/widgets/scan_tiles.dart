import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/services/services.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  ScanTiles(@required this.tipo);
  @override
  Widget build(BuildContext context) {
    final scanListService = Provider.of<ScanListService>(context);
    final scans = scanListService.scans;
    return ListView.builder(
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) =>
            Provider.of<ScanListService>(context, listen: false)
                .borrarScanPorId(scans[i].id!),
        child: ListTile(
          leading: Icon(this.tipo == 'http' ? Icons.directions : Icons.map,
              color: Theme.of(context).backgroundColor),
          title: Text(scans[i].valor!),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Theme.of(context).backgroundColor),
          onTap: () => launchURL(context, scans[i]),
        ),
      ),
      itemCount: scans.length,
    );
  }
}
