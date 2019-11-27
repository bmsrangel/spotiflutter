import 'package:spotiflutter/app/modules/tracks/tracks_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_page.dart';

class TracksModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TracksController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => TracksPage();

  static Inject get to => Inject<TracksModule>.of();
}
