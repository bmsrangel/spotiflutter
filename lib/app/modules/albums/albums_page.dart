import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/modules/albums/albums_controller.dart';
import 'package:spotiflutter/app/modules/albums/albums_module.dart';
import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/artists/artists_module.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_module.dart';

class AlbumsPage extends StatefulWidget {
  final String title;
  const AlbumsPage({Key key, this.title = "Albums"}) : super(key: key);

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  final controller = AlbumsModule.to.bloc<AlbumsController>();
  final selectedArtist = ArtistsModule.to.bloc<ArtistsController>().selectedArtist;
  @override
  void initState() {
    controller.getAlbumsByArtist(selectedArtist.id);
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
                selectedArtist.name,
                style: Theme.of(context).primaryTextTheme.title,
              ),
              Observer(
                builder: (_) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: controller.albums.length,
                      separatorBuilder: (BuildContext context, int index) => Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            controller.albums[index].name,
                            style: Theme.of(context).primaryTextTheme.caption,
                          ),
                          onTap: () {
                            controller.selectedAlbum = controller.albums[index];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => TracksModule()));
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
