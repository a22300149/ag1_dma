import 'package:flutter/material.dart';

class Tercerapantalla extends StatefulWidget {
  @override
  State<Tercerapantalla> createState() => _MyAppState();
}

class _MyAppState extends State<Tercerapantalla> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
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

            ],
          ),
        ),
      ),
    );
  }
}
