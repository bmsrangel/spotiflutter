import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotiflutter/app/modules/player/player_controller.dart';

class PlayerWidget extends StatefulWidget {
  final PlayerController playerController;

  const PlayerWidget({Key key, this.playerController}) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  void initState() {
    widget.playerController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(8),
      child: Observer(
        builder: (_) {
          return Column(
            children: <Widget>[
              _progressBar(widget.playerController),
              timers(widget.playerController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // slideBar(playerController),
                  // buttons(Icons.shuffle, () {}),

                  buttons(Icons.skip_previous, widget.playerController.back),
                  buttons(widget.playerController.icon, widget.playerController.play),
                  buttons(Icons.skip_next, widget.playerController.next),
                  // buttons(Icons.repeat, () {})
                ],
              ),
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
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }

  Widget timers(PlayerController playerController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        playerController.currentPosition.inMilliseconds == null
            ? _retornarTempoMusica(Duration(milliseconds: 0))
            : _retornarTempoMusica(playerController.currentPosition),
        _retornarTempoMusica(playerController.currentDuration),
      ],
    );
  }

  Widget _retornarTempoMusica(Duration position) {
    String tempoMusica =
        "${position.inMinutes.remainder(60).toString().padLeft(2, '0')}:${position.inSeconds.remainder(60).toString().padLeft(2, '0')}";
    return Text(
      tempoMusica,
      style: Theme.of(context).primaryTextTheme.subhead,
    );
  }

  Widget _progressBar(PlayerController playerController) {
    return Slider(
      onChanged: (double value) {
        playerController.seeker(value);
      },
      value: playerController.currentPosition.inMilliseconds.toDouble(),
      min: 0.0,
      max: playerController.currentDuration.inMilliseconds.toDouble(),
      activeColor: Colors.green,
    );
  }
}
