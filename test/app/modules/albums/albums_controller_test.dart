import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/modules/albums/albums_controller.dart';
import 'package:spotiflutter/app/modules/albums/albums_module.dart';

void main() {
  initModule(AlbumsModule());
  AlbumsController albums;

  setUp(() {
    albums = AlbumsModule.to.bloc<AlbumsController>();
  });

  group('AlbumsController Test', () {
    test("First Test", () {
      expect(albums, isInstanceOf<AlbumsController>());
    });

    test("Set Value", () {
      expect(albums.value, equals(0));
      albums.increment();
      expect(albums.value, equals(1));
    });
  });
}
