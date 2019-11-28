import 'package:flutter/material.dart';
import 'package:spotiflutter/app/models/artist_model.dart';
import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/artists/artists_module.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_module.dart';

class InicioPage extends StatefulWidget {
  final String title;
  const InicioPage({Key key, this.title = "Inicio"}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final artistsController = InicioModule.to.bloc<ArtistsController>();
  List<ArtistModel> artistsList;

  @override
  void initState() {
    artistsController.getArtists();
    artistsList.addAll(artistsController.artists);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Recentemente tocadas",
              style: Theme.of(context).primaryTextTheme.title,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: artistsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(artistsList[index].name),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
