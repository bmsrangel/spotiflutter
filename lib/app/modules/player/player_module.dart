import 'package:spotiflutter/app/models/track_model.dart';
import 'package:spotiflutter/app/modules/player/player_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:spotiflutter/app/modules/player/player_page.dart';

class PlayerModule extends ModuleWidget {
  final TrackModel track;

  PlayerModule(this.track);
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PlayerController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PlayerPage(track: track);

  static Inject get to => Inject<PlayerModule>.of();
}
