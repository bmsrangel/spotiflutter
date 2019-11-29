import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/app_module.dart';
import 'package:spotiflutter/app/models/album_model.dart';
import 'package:spotiflutter/app/models/artist_model.dart';
import 'package:spotiflutter/app/modules/albums/albums_module.dart';
import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/artists/artists_module.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_controller.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_module.dart';

class InicioPage extends StatefulWidget {
  final String title;
  const InicioPage({Key key, this.title = "Inicio"}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final controller = InicioModule.to.bloc<InicioController>();

  @override
  void initState() {
    controller.getRecentArtists();
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
            Observer(
              builder: (BuildContext context) {
                return Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.artistList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                            var page = AlbumsModule();
                            return page;
                          }));
                        },
                        child: _listTile(controller.artistList[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile(ArtistModel artist) {
    return Container(
      width: 200,
      height: 150,
      child: Column(
        children: <Widget>[
          Text(
            "Imagem aqui",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            artist.name,
            style: Theme.of(context).primaryTextTheme.caption,
          )
        ],
      ),
    );
  }
}
