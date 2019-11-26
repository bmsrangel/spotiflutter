import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/modules/widgets/player/player_controller.dart';
import 'package:spotiflutter/app/app_module.dart';

void main() {
  initModule(AppModule());
  PlayerController player;

  setUp(() {
    player = AppModule.to.bloc<PlayerController>();
  });

  group('PlayerController Test', () {
    test("First Test", () {
      expect(player, isInstanceOf<PlayerController>());
    });

    test("Set Value", () {
      expect(player.value, equals(0));
      player.increment();
      expect(player.value, equals(1));
    });
  });
}
