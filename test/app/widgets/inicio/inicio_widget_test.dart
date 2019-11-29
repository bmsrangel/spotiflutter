import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spotiflutter/app/widgets/inicio/inicio_widget.dart';

main() {
  testWidgets('InicioWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(InicioWidget()));
    final textFinder = find.text('Inicio');
    expect(textFinder, findsOneWidget);
  });
}
