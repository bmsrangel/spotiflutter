import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/modules/player/player_module.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_controller.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_module.dart';

class TracksPage extends StatefulWidget {
  final String title;
  final int idAlbum;
  const TracksPage({Key key, this.title = "Tracks", this.idAlbum}) : super(key: key);

  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  final controller = TracksModule.to.bloc<TracksController>();

  @override
  void initState() {
    controller.getTracksByAlbum(widget.idAlbum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(
          builder: (BuildContext context) {
            return ListView.separated(
              itemCount: controller.tracks.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(controller.tracks[index].name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PlayerModule(controller.tracks[index])));
                  },
                );
              },
            );
          },
        ));
  }
}
