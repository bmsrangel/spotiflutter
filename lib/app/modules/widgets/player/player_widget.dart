import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/models/track_model.dart';
import 'package:spotiflutter/app/modules/player/player_controller.dart';

class PlayerWidget extends StatelessWidget {
  final TrackModel track;
  final PlayerController playerController;

  const PlayerWidget({Key key, this.track, this.playerController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Observer(
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // buttons(Icons.shuffle, () {}),
              buttons(Icons.skip_previous, playerController.back),
              buttons(playerController.icon, playerController.play),
              buttons(Icons.skip_next, () {}),
              // buttons(Icons.repeat, () {})
            ],
          );
        },
      ),
    );
  }

  Widget buttons(IconData iconData, Function onPressed) {
    return Container(
      height: 100,
      width: 100,
      child: IconButton(
        icon: Icon(
          iconData,
          size: iconData == Icons.play_circle_filled || iconData == Icons.pause_circle_filled
              ? 80
              : iconData == Icons.skip_next || iconData == Icons.skip_previous ? 50 : 25,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
