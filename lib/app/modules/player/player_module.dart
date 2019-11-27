import 'package:audioplayer2/audioplayer2.dart';
import 'package:spotiflutter/app/modules/player/player_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:spotiflutter/app/modules/player/player_page.dart';

class PlayerModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PlayerController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => AudioPlayer()),
      ];

  @override
  Widget get view => PlayerPage();

  static Inject get to => Inject<PlayerModule>.of();
}
