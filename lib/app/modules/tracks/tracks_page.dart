import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/modules/albums/albums_controller.dart';
import 'package:spotiflutter/app/modules/albums/albums_module.dart';
import 'package:spotiflutter/app/modules/player/player_module.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_controller.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_module.dart';

class TracksPage extends StatefulWidget {
  final String title;
  const TracksPage({Key key, this.title = "Tracks"}) : super(key: key);

  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  final controller = TracksModule.to.bloc<TracksController>();
  final selectedAlbum = AlbumsModule.to.bloc<AlbumsController>().selectedAlbum;

  @override
  void initState() {
    controller.getTracksByAlbum(selectedAlbum.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                selectedAlbum.name,
                style: Theme.of(context).primaryTextTheme.title,
              ),
              Observer(
                builder: (BuildContext context) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: controller.tracks.length,
                      separatorBuilder: (BuildContext context, int index) => Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            controller.tracks[index].name,
                            style: Theme.of(context).primaryTextTheme.caption,
                          ),
                          onTap: () {
                            controller.selectedTrack = controller.tracks[index];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => PlayerModule()));
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
