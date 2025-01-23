import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'second_screen.dart'; // Importa la segunda pantalla

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isRegistered = prefs.getBool('isRegistered') ?? false;

  runApp(MyApp(isRegistered: isRegistered));
}

class MyApp extends StatelessWidget {
  final bool isRegistered;

  MyApp({required this.isRegistered});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Usuario',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: isRegistered ? SecondScreen() : FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Función para guardar los datos en SharedPreferences
  _registerUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailController.text);
    prefs.setString('username', usernameController.text);
    prefs.setString('password', passwordController.text);
    prefs.setBool('isRegistered', true);  // Marca el registro como completo
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario de Registro'),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,  // Establece el color de fondo del botón a rojo
              ),
              onPressed: _registerUser,
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
