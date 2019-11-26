import 'package:spotiflutter/app/modules/player/player_controller.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:spotiflutter/app/repositories/hasura_repository.dart';
import 'package:spotiflutter/app/app_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:spotiflutter/app/app_widget.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PlayerController()),
        Bloc((i) => AppController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => HasuraRepository(i.get<HasuraConnect>())),
        Dependency((i) => HasuraConnect("http://spotiflutter.herokuapp.com/v1/graphql")),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
