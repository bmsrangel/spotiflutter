import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/modules/albums/albums_module.dart';
import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/artists/artists_module.dart';

class ArtistsPage extends StatefulWidget {
  final String title;
  const ArtistsPage({Key key, this.title = "Artists"}) : super(key: key);

  @override
  _ArtistsPageState createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  final controller = ArtistsModule.to.bloc<ArtistsController>();

  @override
  void initState() {
    controller.getArtists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        flexibleSpace: Container(
          height: 100,
          alignment: Alignment.bottomCenter,
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "Pesquisar",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search, color: Colors.white,)
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.separated(
            itemCount: controller.artists.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(controller.artists[index].name),
                onTap: () {
                  controller.selectedArtist = controller.artists[index];
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumsModule()));
                },
              );
            },
          );
        },
      ),
    );
  }
}
