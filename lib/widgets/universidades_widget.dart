import 'package:flutter/material.dart';
import 'package:patrones/modelos/almub.dart';
import 'package:patrones/widgets/skeleton_widget.dart';

class albumWidget extends StatelessWidget {
  final List<Albumes> albumes;
  bool loading;

  //final loadings = globals.loading;
  albumWidget({required this.albumes, required this.loading});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Pagina API'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return buildSkeleton();
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Pagina API'),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: albumes.length,
          itemBuilder: (context, index) {
            final album = albumes[index];
            return buildAlbumess(album, context);
          },
        )),
      );
    }
  }

  Widget buildSkeleton() {
    return ListTile(
      leading: SkeletonWidget.rectangular(width: 60, height: 70),
      title: SkeletonWidget.text(width: 70, height: 17),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 3),
        SkeletonWidget.text(width: 60, height: 9),
        SizedBox(height: 3),
        SkeletonWidget.text(width: 60, height: 9),
      ]),
    );
  }

  Widget buildAlbumess(Albumes album, BuildContext context) {
    return ListTile(
      //tileColor: Colors.blueGrey[900],
      leading: Image.network(album.cover),
      title: Text(
        album.title,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Artista: " + album.artist,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        Text(
          "Numero canciones: " + album.tracks.toString(),
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ]),
    );
  }
}
