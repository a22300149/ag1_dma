import 'package:flutter/material.dart';
import 'insertar.dart';
import 'actualizar.dart';
import 'eliminar.dart';
import 'seleccionar.dart';


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
      routes: {
        '/insertar': (context) => InsertarPage(),
        '/actualizar': (context) => ActualizarPage(),
        '/eliminar': (context) => EliminarPage(),
        '/seleccionar': (context) => SeleccionarPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AG13 - Base de datos'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Insertar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/insertar');
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Actualizar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/actualizar');
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Eliminar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/eliminar');
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Seleccionar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/seleccionar');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Bienvenido a la Gestión de Datos',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
