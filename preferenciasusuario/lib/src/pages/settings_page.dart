import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;
  String _nombre = 'Pedro';
  TextEditingController? _textController;
  final prefs = new PreferenciasUsuario();
  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    // cargarPref();
    _textController = new TextEditingController(text: prefs.nombre);
  }

  // cargarPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _genero = prefs.getInt('genero')!;
  //   setState(() {});
  // }

  _setSelectedRadio(int? value) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('genero', value as int);
    prefs.genero = value as int;
    _genero = value ?? 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona que esta usando el telefono',
              ),
              onChanged: (value) {
                prefs.nombre = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
