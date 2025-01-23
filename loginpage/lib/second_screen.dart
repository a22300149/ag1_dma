import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String email = '';
  String username = '';
  String password = '';

  // Función para cargar los datos de SharedPreferences
  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
      username = prefs.getString('username') ?? '';
      password = prefs.getString('password') ?? '';
    });
  }

  // Función para cerrar sesión
  _logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('username');
    prefs.remove('password');
    prefs.setBool('isRegistered', false);  // Marca el registro como incompleto
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FirstScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Cargar los datos al inicio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Datos Registrados'), centerTitle: true,),
      body: Center(  // Centra el contenido en la pantalla
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,  // Centra verticalmente
            crossAxisAlignment: CrossAxisAlignment.center,  // Centra horizontalmente
            children: [
              SizedBox(height: 20,),
              Text('Correo Electrónico: $email', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text('Usuario: $username', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text('Contraseña: $password', style: TextStyle(fontSize: 18)),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,  // Establece el color de fondo del botón a rojo
                ),
                onPressed: _logoutUser,
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
