import 'package:ag11/database_operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'student.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'database_operations.dart';

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
  late Future<List<Student>> Studentss;
  TextEditingController controller = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  late String lastname;
  late String name;
  late int curUserId;

  final formkey = new GlobalKey<FormState>();
  var dbHelper;
  late bool isUpdating;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  //Metodos auxiliares
  refreshList() {
    //Cargar con un select
    setState(() {
      Studentss = dbHelper.getStudentss();
    });
  }

  clearName() {
    //Limpiar campo de texto
    controller.text = '';
    lastnameController.text = '';
  }

  validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState?.save();
      if (isUpdating) {
        Student e = Student(id: curUserId, firstName: name, lastName: lastname);
        dbHelper.update(e);
        setState(() {
          isUpdating = false;
        });
      } else {
        Student e = Student(id: null, firstName: name, lastName: lastname);
        dbHelper.save(e);
      }
      clearName();
      refreshList();
    }
  }

  Widget form() {
    return Form(
      key: formkey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nombre",
              ),
              validator: (val) => val?.length == 0 ? 'Ingrese nombre' : null,
              onSaved: (val) => name = val!,
            ),
            TextFormField(
              controller: lastnameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Apellido",
              ),
              validator: (val) => val?.length == 0 ? 'Ingrese Apellido' : null,
              onSaved: (val) => lastname = val!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  onPressed: validate,
                  child: Text(isUpdating ? 'Actualizar' : 'Agregar'),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                  },
                  child: Text('Cancelar'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //Scrollview

  SingleChildScrollView dataTable(List<Student> studentss) {
    if (studentss.isEmpty) {
      return SingleChildScrollView(
        child: Center(child: Text("No hay estudiantes para mostrar")), // Ahora envuelvo el Text dentro de SingleChildScrollView
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Apellido')),
          DataColumn(label: Text('Borrar')),
        ],
        rows: studentss.map((mapStudent) {
          return DataRow(cells: [
            DataCell(
              Text(mapStudent.firstName, style: TextStyle(color: Colors.black)),
              onTap: () {
                print("Nombre: ${mapStudent.firstName}");
                setState(() {
                  isUpdating = true;
                  curUserId = mapStudent.id ?? 0;
                });
                controller.text = mapStudent.firstName;
              },
            ),
            DataCell(
              Text(mapStudent.lastName, style: TextStyle(color: Colors.black)),
              onTap: () {
                print("Apellido: ${mapStudent.lastName}");
                setState(() {
                  isUpdating = true;
                  curUserId = mapStudent.id ?? 0;
                });
                lastnameController.text = mapStudent.lastName;
              },
            ),
            DataCell(
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  dbHelper.delete(mapStudent.id!);
                  refreshList();
                },
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }




  //Vsita principal

  Widget list() {
    return Expanded(
      child: FutureBuilder<List<Student>>(
        future: Studentss,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error al cargar los datos"));
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return dataTable(snapshot.data!); // Asegúrate de que snapshot.data no sea null
          } else {
            return Center(child: Text("No hay estudiantes disponibles."));
          }
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Sqlite basic operations"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [form(), list()],
        ),
      ),
    );
  }
}
