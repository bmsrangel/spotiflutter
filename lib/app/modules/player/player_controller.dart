import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:spotiflutter/app/models/track_model.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerBase with _$PlayerController;

abstract class _PlayerBase with Store {
  static AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
  
  @observable
  TrackModel currentTrack;

  @observable
  IconData icon = Icons.play_circle_filled;

  @action
  play() async {
    if (audioPlayer.state == AudioPlayerState.PAUSED ||
        audioPlayer.state == AudioPlayerState.STOPPED) {
      await audioPlayer.play(currentTrack.downloadUrl);

      // currentTrack.duration = await audioPlayer.getDuration();
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
