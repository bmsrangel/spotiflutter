import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:audioplayer2/audioplayer2.dart';
import 'package:spotiflutter/app/models/track_model.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerBase with _$PlayerController;

abstract class _PlayerBase with Store {
  static AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState playerState = AudioPlayerState.STOPPED;

  @observable
  TrackModel currentTrack;

  @observable
  Duration currentDuration = Duration(milliseconds: 0);

  StreamSubscription positionSubscription;
  StreamSubscription stateSubscription;

  @observable
  Duration currentPosition = Duration(milliseconds: 0);

  @observable
  IconData icon = Icons.play_circle_filled;

  _PlayerBase() {
    positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((position) => currentPosition = position);

    stateSubscription = audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == AudioPlayerState.PLAYING) {
        currentDuration = audioPlayer.duration;
      } else if (state == AudioPlayerState.STOPPED) {
        if (state == AudioPlayerState.COMPLETED) {
          currentPosition = audioPlayer.duration;
        }
      }
    });
  }

  @action
  play() async {
    if (playerState == AudioPlayerState.PLAYING) {
      await audioPlayer.pause();
      icon = Icons.play_circle_filled;
      playerState = AudioPlayerState.PAUSED;
    } else {
      await audioPlayer.play(currentTrack.downloadUrl);
      playerState = AudioPlayerState.PLAYING;
      icon = Icons.pause_circle_filled;
    }
  }

  @action
  back() async {
    await audioPlayer.stop();
    playerState = AudioPlayerState.STOPPED;
    play();
  }
}
