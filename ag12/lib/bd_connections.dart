import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Student.dart';
import 'dart:convert';

class BDConnections {
  static const SERVER = "http://192.168.0.78:8080/Students/sqloperations.php";
  static const _CREATE_TABLE_COMMAND = "CREATE_TABLE";
  static const _SELECT_TABLE_COMMAND = "SELECT_TABLE";
  static const _INSERT_TABLE_COMMAND = "INSERT_DATA";

  //Crear tabla
  static Future<String> createTable() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_COMMAND;
      final response = await http.post(Uri.parse(SERVER), body: map);
      print('Table response: ${response.body}');

      if (200 == response.statusCode) {
        print(response.body.toString());
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print("Error creando tabla o la tabla ya existe");
      print(e.toString());
      return "error";
    }
  }

  //Obtener datos del servidor
  static Future<List<Student>> selectData() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _SELECT_TABLE_COMMAND;
      final response = await http.post(Uri.parse(SERVER), body: map);
      print('Select response: ${response.body}');

      if (200 == response.statusCode) {
        // Mapear lista
        List<Student> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      print("Error obteniendo datos");
      print(e.toString());
      return [];
    }
  }


  static List<Student> parseResponse(String responsebody) {
    final parseData = json.decode(responsebody).cast<Map<String, dynamic>>();
    return parseData.map<Student>((json) => Student.fromJson(json)).toList();
  }

  //Insertar datos
  static Future<String> insertData(String nombre, String apellido_pat, String apellido_mat,String tel, String mail) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _INSERT_TABLE_COMMAND;
      map['NOMBRE'] = nombre;
      map['APELLIDO_PAT'] = apellido_pat;
      map['APELLIDO_MAT'] = apellido_mat;
      map['TEL'] = tel;
      map['MAIL'] = mail;
      final response = await http.post(Uri.parse(SERVER), body: map);
      print('Insert response: ${response.body}');

      if (200 == response.statusCode) {
        print("Insert Success");
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print("Error añadiendo datos a la tabla");
      print(e.toString());
      return "error";
    }
  }
}

