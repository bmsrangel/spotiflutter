import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/modules/artists/artists_page.dart';

main() {
  testWidgets('ArtistsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ArtistsPage(title: 'Artists')));
    final titleFinder = find.text('Artists');
    expect(titleFinder, findsOneWidget);
  });
}
