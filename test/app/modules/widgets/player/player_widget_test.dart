import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spotiflutter/app/modules/widgets/player/player_widget.dart';

main() {
  testWidgets('PlayerWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PlayerWidget()));
    final textFinder = find.text('Player');
    expect(textFinder, findsOneWidget);
  });
}
