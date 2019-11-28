import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/artists/artists_module.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_page.dart';

class InicioModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => InicioController()),
        Bloc((i) => ArtistsController())
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => InicioPage();

  static Inject get to => Inject<InicioModule>.of();
}
