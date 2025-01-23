// Importa los paquetes necesarios de Flutter para construir la interfaz de usuario y manejar recursos multimedia
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert'; // Para convertir datos JSON
import 'dart:async'; // Para trabajar con asincronía y Futures
import 'dart:developer'; // Para registro de depuración
import 'package:audioplayers/audioplayers.dart'; // Para reproducir audio

// Punto de entrada de la aplicación
void main() {
  runApp(MyApp()); // Ejecuta la aplicación
}

// Definición de la clase principal de la aplicación que extiende StatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de modo debug
      home: HomePage(), // Define la página inicial
      theme: ThemeData.light(), // Tema claro
      darkTheme: ThemeData.dark(), // Tema oscuro
    );
  }
}

// Clase de la página de inicio que es un StatefulWidget, ya que tendrá un estado dinámico
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Estado de la página de inicio
class _HomePageState extends State<HomePage> {
  late AudioPlayer _audioPlayer; // Variable para manejar el reproductor de audio

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Inicializa el reproductor de audio
    _playBackgroundMusic(); // Reproduce música de fondo al inicio
  }

  // Función asincrónica que configura el audio en modo de bucle y reproduce el archivo especificado
  Future<void> _playBackgroundMusic() async {
    try {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop); // Configura el modo de bucle
      await _audioPlayer.play(AssetSource('New_Moon.mp3')); // Reproduce la música de fondo
    } catch (e) {
      print("Error al reproducir música de fondo: $e"); // Maneja errores en la reproducción
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Libera el recurso de audio al destruir el widget
    super.dispose();
  }

  // Función que carga un archivo JSON del directorio de assets de la aplicación
  Future<String> _loadAsset() async {
    return await rootBundle.loadString("assets/person.json");
  }

  // Función que obtiene los héroes desde el archivo JSON cargado
  Future<List<heroes>> _getHeroes() async {
    String jsonString = await _loadAsset(); // Carga el contenido del archivo JSON
    var jsonData = json.decode(jsonString); // Decodifica el JSON
    print(jsonData.toString()); // Muestra el contenido del JSON para depuración

    // Convierte los datos JSON en una lista de objetos de tipo heroes
    List<heroes> heros = [];
    for (var h in jsonData) {
      heroes he = heroes(
        h["imagen"],
        h["nombre"],
        h["identidad"],
        h["descripcion"],
      );
      heros.add(he); // Agrega cada héroe a la lista
    }
    print("Números de elementos");
    print(heros.length); // Muestra la cantidad de elementos obtenidos
    return heros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AG9 - Json"), // Título de la app en la barra de la aplicación
        centerTitle: true, // Centra el título
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0), // Margen para el contenido
        child: FutureBuilder(
            future: _getHeroes(), // Llama a la función que obtiene los héroes
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) { // Si los datos aún no están listos
                return Container(
                  child: Center(
                    child: Text("Cargando"), // Muestra "Cargando" mientras se obtienen los datos
                  ),
                );
              } else { // Si los datos están listos
                return ListView.builder(
                  itemCount: snapshot.data.length, // Número de elementos en la lista
                  itemBuilder: ((BuildContext context, int index) {
                    print("Data value: $snapshot.data[index].toString()");
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index].imagen.toString(), // Imagen del héroe
                        ),
                      ),
                      title: Text(snapshot.data[index].nombre.toString()), // Nombre del héroe
                      subtitle: Text(snapshot.data[index].identidad.toString()), // Identidad secreta
                      onTap: () {
                        // Navega a una nueva página con detalles del héroe seleccionado
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(snapshot.data[index])));
                      },
                    );
                  }),
                );
              }
            }),
      ),
    );
  }
}

// Clase que representa un héroe con sus atributos
class heroes {
  final String imagen;
  final String nombre;
  final String identidad;
  final String descripcion;

  heroes(this.imagen, this.nombre, this.identidad, this.descripcion); // Constructor de la clase
}

// Página de detalles del héroe
class DetailPage extends StatelessWidget {
  final heroes hero;

  DetailPage(this.hero); // Recibe un héroe como parámetro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.nombre.toString()), // Muestra el nombre del héroe
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(hero.descripcion.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.grey)), // Muestra la descripción del héroe
            ],
          )),
    );
  }
}
