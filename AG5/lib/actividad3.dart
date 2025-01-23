import 'package:flutter/material.dart';

class Actividad3 extends StatefulWidget {
  @override
  State<Actividad3> createState() => _MyAppState();
}

class _MyAppState extends State<Actividad3> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
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
          title: Text('AI3 Contador'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      'El contador vale:',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (contador > 0) {
                        contador--;
                      } else {
                        contador = contador - 0;
                      }
                      setState(() {});
                      print("$contador");
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    '$contador',
                    style: TextStyle(fontSize: 40),
                  ),
                  IconButton(
                    onPressed: () {
                      if (contador < 50) {
                        contador++;
                      } else {
                        contador = contador + 0;
                      }
                      setState(() {});
                      print("$contador");
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.green,
                    ),
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
