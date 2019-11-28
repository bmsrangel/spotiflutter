import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/modules/albums/albums_module.dart';
import 'package:spotiflutter/app/modules/home/home_controller.dart';
import 'package:spotiflutter/app/modules/home/home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeModule.to.bloc<HomeController>();

  @override
  void initState() {
    controller.getArtists();
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
