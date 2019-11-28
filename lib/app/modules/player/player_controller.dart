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
  List<TrackModel> playlist = TracksModule.to.bloc<TracksController>().tracks;

  @observable
  TrackModel selectedTrack = TracksModule.to.bloc<TracksController>().selectedTrack;

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
    stop();
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((position) {
      if (position < currentDuration) {
        currentPosition = position;
      } else {
        currentPosition = currentDuration;
      }
    });

    stateSubscription = audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == AudioPlayerState.PLAYING) {
        currentDuration = audioPlayer.duration;
      } else if (state == AudioPlayerState.STOPPED) {
      } else if (state == AudioPlayerState.COMPLETED) {
        if (playlist.indexOf(selectedTrack) == playlist.length - 1) {
          stop();
          selectedTrack = playlist[0];
        } else {
          next();
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
  }

  @action
  back() async {
    if (currentPosition.inSeconds > 2) {
      await audioPlayer.stop();
      playerState = AudioPlayerState.STOPPED;
      play();
    } else {
      int currentTrackListPosition = playlist.indexOf(selectedTrack);
      if (currentTrackListPosition > 0) {
        playerState = AudioPlayerState.STOPPED;
        stop();
        selectedTrack = playlist[currentTrackListPosition - 1];
        play();
      }
    }
  }

  @action
  stop() async {
    await audioPlayer.stop();
    playerState = AudioPlayerState.STOPPED;
    currentPosition = Duration(milliseconds: 0);
    icon = Icons.play_circle_filled;
    // positionSubscription.cancel();
    // stateSubscription.cancel();
  }

  seeker(double value) async {
    audioPlayer.seek(value / 1000);
  }

  @action
  next() async {
    int currentTrackListPosition = playlist.indexOf(selectedTrack);
    if (currentTrackListPosition < playlist.length &&
        currentTrackListPosition + 1 != playlist.length) {
      playerState = AudioPlayerState.STOPPED;
      stop();
      selectedTrack = playlist[currentTrackListPosition + 1];
      play();
    }
  }
}

completedStateHandler() {}
