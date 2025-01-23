import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'pokemon.dart';
import 'package:http/http.dart' as http;

class pokedetails extends StatelessWidget {
  final Pokemon pokemon;

  pokedetails({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? ''),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    pokemon.name ?? '',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text(
                    "Type:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                            ?.map((ty) => FilterChip(
                                  backgroundColor: Colors.redAccent,
                                  label: Text(ty),
                                  onSelected: (b) {},
                                ))
                            .toList() ??
                        [],
                  ),
                  Text(
                    "Weakness:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                            ?.map((ty) => FilterChip(
                                  backgroundColor: Colors.green,
                                  label: Text(ty),
                                  onSelected: (b) {},
                                ))
                            .toList() ??
                        [],
                  ),
                  Text(
                    "Next evolution:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.evolutions
                            ?.map((ty) => FilterChip(
                                  backgroundColor: Colors.orange,
                                  label: Text(ty),
                                  onSelected: (b) {},
                                ))
                            .toList() ??
                        [],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(tag: pokemon.img?? 'defaultTag',
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(pokemon.img?? 'defaultTag')
                    )
                  ) ,

                )
            ),
          )
        ],
      ),
    );
  }
}
