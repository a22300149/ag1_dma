import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'actividad2.dart';
import 'actividad3.dart';
import 'actividad4.dart';

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
      appBar: AppBar(
        title: Text("AG5 Aplicación integradora"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(40),
            ),
            Column(
              children: [
                Text(
                  "Selecciona una actividad:",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Center(
              child: MaterialButton(
                child: Text(
                  "Actividad 2",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Actividad2()));
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: MaterialButton(
                child: Text(
                  "Actividad 3",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Actividad3()));
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: MaterialButton(
                child: Text(
                  "Actividad 4",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Actividad4()));
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
