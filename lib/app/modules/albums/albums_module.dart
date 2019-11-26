import 'package:spotiflutter/app/modules/albums/albums_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:spotiflutter/app/modules/albums/albums_page.dart';

class AlbumsModule extends ModuleWidget {
  final int idArtist;

  AlbumsModule(this.idArtist);
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AlbumsController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AlbumsPage(
        idArtist: idArtist,
      );

  static Inject get to => Inject<AlbumsModule>.of();
}
