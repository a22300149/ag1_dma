import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JSON Local"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("json_assets/person.json"),
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10),
                        Image.network(
                          jsonData[index]["imagen"], // 'imagen' es una URL
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons
                                .error); // Muestra un ícono de error si no se carga la imagen
                          },
                          height: 100.0, width: 50.0,
                        ),
                        SizedBox(height: 10),
                        Text("Nombre: " + jsonData[index]["nombre"]),
                        Text("Identidad secreta: " +
                            jsonData[index]["identidad"]),
                        Text("Descripción: " + jsonData[index]["descripcion"]),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
                itemCount: jsonData == null ? 0 : jsonData.length,
              );
            }),
      ),
    );
  }
}
