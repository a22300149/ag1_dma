import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Student.dart';
import 'dart:convert';
import 'bd_connections.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  List<Student> _Students = [];
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late TextEditingController _nombreController;
  late TextEditingController _apellidopatController;
  late TextEditingController _apellidomatController;
  late TextEditingController _telController;
  late TextEditingController _mailController;

  @override
  void initState() {
    super.initState();
    _Students = [];
    _scaffoldKey = GlobalKey();
    _nombreController = TextEditingController();
    _apellidopatController = TextEditingController();
    _apellidomatController = TextEditingController();
    _telController = TextEditingController();
    _mailController = TextEditingController();

    // Escuchar los cambios en los controladores y convertir a mayúsculas
    _nombreController.addListener(() {
      _nombreController.value = _nombreController.value.copyWith(
        text: _nombreController.text.toUpperCase(),
        selection: TextSelection.collapsed(offset: _nombreController.text.length),
      );
    });
    _apellidopatController.addListener(() {
      _apellidopatController.value = _apellidopatController.value.copyWith(
        text: _apellidopatController.text.toUpperCase(),
        selection: TextSelection.collapsed(offset: _apellidopatController.text.length),
      );
    });
    _apellidomatController.addListener(() {
      _apellidomatController.value = _apellidomatController.value.copyWith(
        text: _apellidomatController.text.toUpperCase(),
        selection: TextSelection.collapsed(offset: _apellidomatController.text.length),
      );
    });
    _telController.addListener(() {
      _telController.value = _telController.value.copyWith(
        text: _telController.text.toUpperCase(),
        selection: TextSelection.collapsed(offset: _telController.text.length),
      );
    });
    _mailController.addListener(() {
      _mailController.value = _mailController.value.copyWith(
        text: _mailController.text.toUpperCase(),
        selection: TextSelection.collapsed(offset: _mailController.text.length),
      );
    });
  }


  // Desplegar la snackbar
  _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // Crear tabla
  _createTable() {
    BDConnections.createTable().then((result) {
      if ('success' == result) {
        _showSnackBar(context, result);
      }
    });
  }

  // Agregar datos
  _insertData() {
    // Validar campos vacíos
    if (_nombreController.text.isEmpty ||
        _apellidopatController.text.isEmpty ||
        _apellidomatController.text.isEmpty ||
        _telController.text.isEmpty ||
        _mailController.text.isEmpty) {
      _showSnackBar(context, "Por favor, complete todos los campos.");
      return; // No proceder si algún campo está vacío
    }

    // Validar que el teléfono solo contenga números y tenga exactamente 10 dígitos
    if (!_isValidPhoneNumber(_telController.text)) {
      _showSnackBar(context, "El teléfono debe contener exactamente 10 dígitos numéricos.");
      return; // No proceder si el teléfono no es válido
    }

    // Validar el correo electrónico
    if (!_isValidEmail(_mailController.text)) {
      _showSnackBar(context, "Por favor ingrese un correo electrónico válido.");
      return; // No proceder si el correo no es válido
    }

    // Insertar los datos en la base de datos
    BDConnections.insertData(
        _nombreController.text,
        _apellidopatController.text,
        _apellidomatController.text,
        _telController.text,
        _mailController.text)
        .then((result) {
      if ('success' == result) {
        _showSnackBar(context, result);
        // Limpiar los campos después de la inserción
        _nombreController.text = "";
        _apellidopatController.text = "";
        _apellidomatController.text = "";
        _telController.text = "";
        _mailController.text = "";

        // Llamar la consulta general para obtener los datos
        _selectData();
      }
    });
  }

  // Seleccionar datos de la base de datos
  _selectData() {
    BDConnections.selectData().then((students) {
      setState(() {
        _Students = students;
      });
      _showSnackBar(context, "Data Acquired");
      print("Número de estudiantes ${students.length}");
    });
  }

  // Función para validar el correo electrónico
  bool _isValidEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  // Función para validar el teléfono
  bool _isValidPhoneNumber(String phone) {
    // Asegura que el teléfono tenga exactamente 10 dígitos numéricos
    return phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone);
  }

  // Cuerpo de la pantalla (Tabla con los datos)
  SingleChildScrollView _body() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(label: Text("ID")),
          DataColumn(label: Text("Nom")),
          DataColumn(label: Text("ApePat")),
          DataColumn(label: Text("ApeMat")),
          DataColumn(label: Text("Tel")),
          DataColumn(label: Text("Mail")),
        ],
        rows: _Students.map((student) => DataRow(cells: [
          DataCell(Text(student.id)),
          DataCell(Text(student.nombre)),
          DataCell(Text(student.apellido_pat)),
          DataCell(Text(student.apellido_mat)),
          DataCell(Text(student.tel)),
          DataCell(Text(student.mail)),
        ])).toList(),
      ),
    );
  }

  // Construir el menú lateral (Drawer)
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text(
              'Operaciones',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: Text('Insertar'),
            onTap: () {
              Navigator.pop(context);
              _insertData();
            },
          ),
          ListTile(
            title: Text('Actualizar'),
            onTap: () {
              Navigator.pop(context);
              _showSnackBar(context, "Función actualizar aún no implementada");
            },
          ),
          ListTile(
            title: Text('Eliminar'),
            onTap: () {
              Navigator.pop(context);
              _showSnackBar(context, "Función eliminar aún no implementada");
            },
          ),
          ListTile(
            title: Text('Seleccionar'),
            onTap: () {
              Navigator.pop(context);
              _showSnackBar(context, "Función seleccionar aún no implementada");
            },
          ),
          ListTile(
            title: Text('Buscar'),
            onTap: () {
              Navigator.pop(context);
              _showSnackBar(context, "Función buscar aún no implementada");
            },
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Mysql Operaciones Básicas Remotas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              BDConnections.createTable();
            },
          ),
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              BDConnections.selectData();
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _nombreController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration.collapsed(hintText: "Nombre"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _apellidopatController,
                      textCapitalization: TextCapitalization.characters,
                      decoration:
                      InputDecoration.collapsed(hintText: "Apellido paterno"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _apellidomatController,
                      textCapitalization: TextCapitalization.characters,
                      decoration:
                      InputDecoration.collapsed(hintText: "Apellido materno"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _telController,
                      keyboardType: TextInputType.phone, // Permitir solo números
                      maxLength: 10, // Limitar a 10 dígitos
                      decoration: InputDecoration.collapsed(hintText: "Teléfono"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _mailController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration.collapsed(hintText: "E-mail"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _body(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _insertData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
