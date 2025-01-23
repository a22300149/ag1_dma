import 'package:flutter/material.dart';

class Segundapantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
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
