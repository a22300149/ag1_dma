import 'package:flutter/material.dart';

//Función principal en una sola linea
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: new Text(
            "PDM_U2_AI2",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("Hola");
              },
              icon: Icon(Icons.exit_to_app),
              color: Colors.white,
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Hello World'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      child: Text("B1"),
                      color: Colors.green,
                      onPressed: () {
                        print("Boton 1");
                      }),
                  MaterialButton(
                      child: Text("B2"),
                      color: Colors.grey,
                      onPressed: () {
                        print("Boton 2");
                      }),
                  MaterialButton(
                      child: Text("B3"),
                      color: Colors.redAccent,
                      onPressed: () {
                        print("Boton 3");
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
