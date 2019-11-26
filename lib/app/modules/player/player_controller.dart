import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:spotiflutter/app/models/track_model.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerBase with _$PlayerController;

abstract class _PlayerBase with Store {
  AudioPlayer audioPlayer = AudioPlayer();
  TrackModel track;

  @observable
  IconData icon = Icons.play_circle_filled;

  @action
  play() async {
    if (audioPlayer.state == AudioPlayerState.PAUSED ||
        audioPlayer.state == AudioPlayerState.STOPPED) {
      await audioPlayer.play(track.downloadUrl);
      icon = Icons.pause_circle_filled;
    } else {
      await audioPlayer.pause();
      icon = Icons.play_circle_filled;
    }
  }

  @action
  back() async {
    await audioPlayer.stop();
    play();
  }
}
