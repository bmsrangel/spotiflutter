import 'package:flutter/material.dart';
import 'package:spotiflutter/app/models/track_model.dart';
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
    TrackModel selectedTrack = controller.selectedTrack;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text(selectedTrack.name),
          PlayerWidget(
            playerController: controller,
          ),
        ],
      ),
    );
  }
}
