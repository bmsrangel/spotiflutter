import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:audioplayer2/audioplayer2.dart';
import 'package:spotiflutter/app/models/track_model.dart';
import 'package:spotiflutter/app/modules/player/player_module.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_controller.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_module.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerBase with _$PlayerController;

abstract class _PlayerBase with Store {
  // static AudioPlayer audioPlayer = AudioPlayer();
  final audioPlayer = PlayerModule.to.get<AudioPlayer>();
  AudioPlayerState playerState = AudioPlayerState.STOPPED;
  TrackModel newTrack = TracksModule.to.bloc<TracksController>().selectedTrack;

  @observable
  TrackModel selectedTrack;

  // @observable
  // TrackModel currentTrack;

  @observable
  Duration currentDuration = Duration(milliseconds: 0);

  StreamSubscription positionSubscription;
  StreamSubscription stateSubscription;

  @observable
  Duration currentPosition = Duration(milliseconds: 0);

  @observable
  IconData icon = Icons.play_circle_filled;

  _PlayerBase() {
    if (newTrack.id != null) {
      stop();
      selectedTrack = newTrack;
    }
    positionSubscription =
        audioPlayer.onAudioPositionChanged.listen((position) => currentPosition = position);

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
      await audioPlayer.play(selectedTrack.downloadUrl);
      playerState = AudioPlayerState.PLAYING;
      icon = Icons.pause_circle_filled;
    }
    print(selectedTrack.name);
    // await audioPlayer.play(selectedTrack.downloadUrl);
  }

  @action
  back() async {
    await audioPlayer.stop();
    playerState = AudioPlayerState.STOPPED;
    play();
  }

  @action
  stop() async {
    await audioPlayer.stop();
    playerState = AudioPlayerState.STOPPED;
    currentPosition = Duration(milliseconds: 0);
    // positionSubscription.cancel();
    // stateSubscription.cancel();
  }
}
