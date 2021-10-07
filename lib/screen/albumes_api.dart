import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:http/http.dart" as http;
import 'package:patrones/modelos/almub.dart';
import 'package:patrones/widgets/universidades_widget.dart';

class PaginaAPI extends StatefulWidget {
  @override
  _PaginaAPIState createState() => _PaginaAPIState();
}

class _PaginaAPIState extends State<PaginaAPI> {
  List<Albumes> _album = [];
  var loading = true;

  @override
  void initState() {
    super.initState();
    __todasAlbumeses();
  }

  void __todasAlbumeses() async {
    final albumes = await todasAlbumeses();
    setState(() {
      _album = albumes;
      loading = false;
    });
  }

  Future<List<Albumes>> todasAlbumeses() async {
    final response = await http
        .get("https://api.deezer.com/search/album/?q=thebeatles&index=0");

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["data"];

      return list.map((album) => Albumes.fromJson(album)).toList();
    } else {
      throw Exception("Falló la conexión");
    }
  }

  @override
  Widget build(BuildContext context) {
    return albumWidget(albumes: _album, loading: loading);
  }
}
