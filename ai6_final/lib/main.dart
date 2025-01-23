import 'package:ai6_final/cuartaPantalla.dart';
import 'package:ai6_final/segundaPantalla.dart';
import 'package:ai6_final/terceraPantalla.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceActual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barra de navegación"),
        centerTitle: true,
      ),
      body: Center(
        child: _pantallasUsuario.elementAt(_indiceActual),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ads_click,
              color: Colors.green,
            ),
            label: "AI2",

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_alert_sharp,
              color: Colors.green,
            ),
            label: "AI3",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit_outlined,
              color: Colors.green,
            ),
            label: "AI4",
          ),
        ],
        currentIndex: _indiceActual,
        onTap: _onItemTapped,
      ),
    );
  }

  //Lista de Widgets
  List<Widget> _pantallasUsuario = <Widget>[
    Segundapantalla(),
    Tercerapantalla(),
    Cuartapantalla(),
  ];

  //Indice donde se encuentra el BottonNavigation Bar
  _onItemTapped(int _indice) {
    setState(() {
      _indiceActual = _indice;
    });
  }
}
