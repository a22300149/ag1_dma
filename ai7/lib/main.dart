import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'CustomTextField.dart';
import 'CustomButton.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("AI7"),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 80.0)),
          Column(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: new NetworkImage(
                              "https://i.pinimg.com/564x/0c/92/7b/0c927b927a799a7fa209f82960055aff.jpg"),
                          fit: BoxFit.fill)),
                ),
              ),
              Divider(
                color: Colors.deepPurple.shade100,
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsets.all(30),
              ),
              Form(
                  key: _formKey,
              validator: _autovalidate,
                  child: Column(
                    children: [
                      Customtextfield(
                        "Nombre",
                        Icon(Icons.account_circle),
                        _NonEmptyTextValidator as FormFieldValidator<String>,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      Customtextfield("Apellido paterno",
                          Icon(Icons.switch_account_outlined),_NonEmptyTextValidator as FormFieldValidator<String>,),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      Customtextfield(
                          "Apellido materno", Icon(Icons.switch_account),_NonEmptyTextValidator as FormFieldValidator<String>,),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      Customtextfield(
                        "E-mail",
                        Icon(Icons.mail_outline),
                        _MailValidator as FormFieldValidator<String>,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      Customtextfield("No. Celular", Icon(Icons.phone),_NonEmptyTextValidator as FormFieldValidator<String>,),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      Customtextfield("Contraseña", Icon(Icons.password),_NonEmptyTextValidator as FormFieldValidator<String>,),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      Customtextfield(
                          "Confirmar contraseña", Icon(Icons.password),_NonEmptyTextValidator as FormFieldValidator<String>,),
                      MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showSnackBar(context, "Este es un dato valido.");
                          }
                        },
                        child: Text("Aceptar"),
                        color: Colors.greenAccent,
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  //Método para validar

  _NonEmptyTextValidator(String value) {
    return value.isEmpty ? "No puede estar vacío" : null;
  }

  _MailValidator(String value) {
    return value.contains('@') == false ? "Correo no valido" : null;
  }

  _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
