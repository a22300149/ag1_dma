import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final _formKey = GlobalKey<FormState>();

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
  final _nameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _secondnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  final _conpassController = TextEditingController();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Ingresa un correo valido.';
    }
    return null;
  }

  String? validateName(String? name) {
    if (name!.length < 4) {
      return 'No tiene que ser menor a cuatro caracteres.';
    } else {
      RegExp nameRegex = RegExp(r"^[a-zA-Z ]+$");
      final isNameValid = nameRegex.hasMatch(name ?? '');
      if (!isNameValid) {
        return 'No debe ingresar numeros.';
      }
    }
    return null;
  }

  String? validatePhone(String? phone) {
    if (phone!.length < 10 || phone.length > 10) {
      return 'Tiene que ser de 10 digitos.';
    } else {
      RegExp nameRegex = RegExp(r"^[0-9]+$");
      final isNameValid = nameRegex.hasMatch(phone ?? '');
      if (!isNameValid) {
        return 'Solo debe ingresar números.';
      }
    }
    return null;
  }

  String? _validatePasswordMatch(String? value) {
    if (value != _passController.text) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AI7"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Form(
            child: Column(
              key: _formKey,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            image: new NetworkImage(
                                "https://i.pinimg.com/564x/0c/92/7b/0c927b927a799a7fa209f82960055aff.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height: 30),
                    Divider(
                      color: Colors.deepPurple.shade100,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                        ),
                        hintText: 'Nombre',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: validateName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _firstnameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.label_important_outline_sharp),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                        ),
                        hintText: 'Primer apellido',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: validateName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _secondnameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.label_important_outline_sharp),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                        ),
                        hintText: 'Segundo apellido',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: validateName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email_outlined),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                        ),
                        hintText: 'E-mail',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                        ),
                        hintText: 'Teléfono',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: validatePhone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                        ),
                        hintText: 'Contraseña',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (pass) => pass!.length < 8
                          ? 'No tiene que ser menor a 8 caracteres.'
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _conpassController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                        ),
                        hintText: 'Confirmar contraseña',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirma tu contraseña';
                        }
                        return _validatePasswordMatch(value);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.validate();
                          },
                          child: const Text("Enviar"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _nameController.clear();
                              _firstnameController.clear();
                              _secondnameController.clear();
                              _emailController.clear();
                              _phoneController.clear();
                              _passController.clear();
                              _conpassController.clear();
                            });
                          },
                          child: const Text("Cancelar"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
