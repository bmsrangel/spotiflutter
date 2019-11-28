import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/modules/inicio/inicio_page.dart';

main() {
  testWidgets('InicioPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(InicioPage(title: 'Inicio')));
    final titleFinder = find.text('Inicio');
    expect(titleFinder, findsOneWidget);
  });
}
