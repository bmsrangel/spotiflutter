import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/modules/albums/albums_controller.dart';
import 'package:spotiflutter/app/modules/albums/albums_module.dart';
import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/artists/artists_module.dart';
import 'package:spotiflutter/app/modules/player/player_controller.dart';
import 'package:spotiflutter/app/modules/player/player_module.dart';
import 'package:spotiflutter/app/modules/widgets/player/player_widget.dart';

class PlayerPage extends StatefulWidget {
  final String title;
  const PlayerPage({Key key, this.title = "Player"}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final controller = PlayerModule.to.bloc<PlayerController>();
  final selectedAlbum = AlbumsModule.to.bloc<AlbumsController>().selectedAlbum;
  final selectedArtist = ArtistsModule.to.bloc<ArtistsController>().selectedArtist;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Observer(
            builder: (BuildContext context) {
              return Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: sizes.height * .07,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Tocando de",
                              style: Theme.of(context).primaryTextTheme.caption,
                            ),
                            Text(
                              selectedAlbum.name,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        width: sizes.width * 0.85,
                        height: sizes.width * 0.85,
                        child: Image.network(controller.selectedTrack.coverUrl),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              controller.selectedTrack.name,
                              style: Theme.of(context).primaryTextTheme.display1,
                            ),
                            Text(
                              selectedArtist.name,
                              style: Theme.of(context).primaryTextTheme.display2,
                            ),
                          ],
                        ),
                      ),
                      PlayerWidget(
                        playerController: controller,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ));
  }
}
