import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokedetail.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'pokemon.dart';
import 'package:http/http.dart' as http;
//import 'package:audioplayers/audioplayers.dart';

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
  var url = "https://raw.githubusercontent.com/a22300149/POKEMON/refs/heads/main/pokehub.json";

  late POKEMON Pokehub = POKEMON();

  @override
  void initState() {
    super.initState();
    _fetchData();
    print("Descargando");
  }

  _fetchData() async {
    var result = await http.get(Uri.parse(url));
    print(result.body);
    var decodedJson = json.decode(result.body);
    Pokehub = POKEMON.fromJson(decodedJson);
    print(Pokehub.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokedex"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Pokehub == null
            ? Center(child: CircularProgressIndicator())
            : GridView.count(

          crossAxisCount: 2,
        children: Pokehub.pokemon != null
            ? Pokehub.pokemon!.map((poke) => Padding(
          padding: EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(
                  builder: (context)=>pokedetails(pokemon: poke,)
              ));
            },
            child: Hero(
                tag: poke.img?? 'defaultTag',
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 95,
                        width: 95,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(poke.img?? 'defaultTag'),

                              ),
                          ),

                        ),
                        Text(poke.name?? 'Unknown',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),)
                    ],
                  ),
                )
            ),
          ),
        )).toList():[],
        )

    );
  }
}
