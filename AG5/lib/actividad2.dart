import 'package:flutter/material.dart';

class Actividad2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              alignment: Alignment.bottomLeft,
            )
          ],
          title: new Text(
            "PDM_U2_AI2",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
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
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Center(
                child: MaterialButton(
                  child: Text(
                    "Regresar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
