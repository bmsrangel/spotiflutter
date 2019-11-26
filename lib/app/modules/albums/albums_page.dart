import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/modules/albums/albums_controller.dart';
import 'package:spotiflutter/app/modules/albums/albums_module.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_module.dart';

class AlbumsPage extends StatefulWidget {
  final String title;
  final int idArtist;
  const AlbumsPage({Key key, this.title = "Albums", this.idArtist}) : super(key: key);

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  final controller = AlbumsModule.to.bloc<AlbumsController>();
  @override
  void initState() {
    controller.getAlbumsByArtist(widget.idArtist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(
          builder: (_) {
            return ListView.separated(
              itemCount: controller.albums.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(controller.albums[index].name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TracksModule(controller.albums[index].id)));
                  },
                );
              },
            );
          },
        ));
  }
}
