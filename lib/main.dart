// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:patrones/pagina_api.dart';
import 'package:patrones/screen/albumes_api.dart';
import 'package:patrones/widgets/universidades_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patron Skeleton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Primera Página")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Para cargar los datos del API de Deezer de los álbumes de The Beatles dale click al botón de abajo.',
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(
              'Obtener API',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaginaAPI()));
            },
          ),
        ],
      ),
    );
  }
}
