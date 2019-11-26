import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/modules/tracks/tracks_controller.dart';
import 'package:spotiflutter/app/modules/tracks/tracks_module.dart';

void main() {
  initModule(TracksModule());
  TracksController tracks;

  setUp(() {
    tracks = TracksModule.to.bloc<TracksController>();
  });

  group('TracksController Test', () {
    test("First Test", () {
      expect(tracks, isInstanceOf<TracksController>());
    });

    test("Set Value", () {
      expect(tracks.value, equals(0));
      tracks.increment();
      expect(tracks.value, equals(1));
    });
  });
}
