import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/modules/tracks/tracks_page.dart';

main() {
  testWidgets('TracksPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TracksPage(title: 'Tracks')));
    final titleFinder = find.text('Tracks');
    expect(titleFinder, findsOneWidget);
  });
}
