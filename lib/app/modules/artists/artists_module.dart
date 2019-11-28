import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/artists/artists_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ArtistsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ArtistsController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ArtistsPage();

  static Inject get to => Inject<ArtistsModule>.of();
}
