import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                Text(controller.selectedTrack.name),
                PlayerWidget(
                  playerController: controller,
                ),
              ],
            );
          },
        ));
  }
}
