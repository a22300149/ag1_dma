import 'package:flutter/material.dart';

class Cuartapantalla extends StatelessWidget {
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _textEditingController = new TextEditingController();
  TextEditingController _textEditingController1 =
  new TextEditingController(text: "");
  TextEditingController _textEditingController2 =
  new TextEditingController(text: "");
  double _total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,

      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total = $_total",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      style: new TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        hintText: "Inserta un primer número",
                        hintStyle: TextStyle(color: Colors.white12),
                      ),
                      controller: _textEditingController1,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      style: new TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        hintText: "Inserta un segundo número",
                        hintStyle: TextStyle(color: Colors.white12),
                      ),
                      controller: _textEditingController2,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          child: Text(
                            "+",
                            style: new TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              _suma();
                            });
                          },
                          splashColor: Colors.tealAccent,
                        ),
                        MaterialButton(
                          child: Text(
                            "-",
                            style: new TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              _resta();
                            });
                          },
                          splashColor: Colors.orange,
                        ),
                        MaterialButton(
                          child: Text(
                            "*",
                            style: new TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          color: Colors.blueAccent,
                          onPressed: () {
                            setState(() {
                              _multiplicacion();
                            });
                          },
                          splashColor: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          child: Text(
                            "/",
                            style: new TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          color: Colors.pinkAccent,
                          onPressed: () {
                            setState(() {
                              _division();
                            });
                          },
                          splashColor: Colors.redAccent,
                        ),
                        MaterialButton(
                          child: Text(
                            "%",
                            style: new TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          color: Colors.deepPurpleAccent,
                          onPressed: () {
                            setState(() {
                              _porcentaje();
                            });
                          },
                          splashColor: Colors.deepPurple,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),

          ],
        ),
      ),
    );
  }

  //Metodo propio para llmar a snackbar
  _showSnackBar(BuildContext context, String mensaje) {
    final snackBar = SnackBar(
      content: new Text(mensaje.toUpperCase()),
    );
    //_scaffoldKey.currentState.showSnackBar(snackbar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _suma() {
    setState(() {
      _total = (double.tryParse(_textEditingController1.text)! +
          double.tryParse(_textEditingController2.text)!);
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  _resta() {
    setState(() {
      _total = (double.tryParse(_textEditingController1.text)! -
          double.tryParse(_textEditingController2.text)!);
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  _multiplicacion() {
    setState(() {
      _total = (double.tryParse(_textEditingController1.text)! *
          double.tryParse(_textEditingController2.text)!);
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  _division() {
    setState(() {
      _total = (double.tryParse(_textEditingController1.text)! /
          double.tryParse(_textEditingController2.text)!);
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  _porcentaje() {
    setState(() {
      _total = ((double.tryParse(_textEditingController2.text)! *
          double.tryParse(_textEditingController1.text)!) /
          100);
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }
}
