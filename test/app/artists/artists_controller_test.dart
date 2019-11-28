import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/artists/artists_controller.dart';
import 'package:spotiflutter/app/artists/artists_module.dart';

void main() {
  initModule(ArtistsModule());
  ArtistsController artists;

  setUp(() {
    artists = ArtistsModule.to.bloc<ArtistsController>();
  });

  group('ArtistsController Test', () {
    test("First Test", () {
      expect(artists, isInstanceOf<ArtistsController>());
    });

    test("Set Value", () {
      expect(artists.value, equals(0));
      artists.increment();
      expect(artists.value, equals(1));
    });
  });
}
