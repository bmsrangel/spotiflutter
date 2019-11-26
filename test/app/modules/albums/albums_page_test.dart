import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/modules/albums/albums_page.dart';

main() {
  testWidgets('AlbumsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AlbumsPage(title: 'Albums')));
    final titleFinder = find.text('Albums');
    expect(titleFinder, findsOneWidget);
  });
}
