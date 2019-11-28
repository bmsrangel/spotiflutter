import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:spotiflutter/app/modules/inicio/inicio_controller.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_module.dart';

void main() {
  initModule(InicioModule());
  InicioController inicio;

  setUp(() {
    inicio = InicioModule.to.bloc<InicioController>();
  });

  group('InicioController Test', () {
    test("First Test", () {
      expect(inicio, isInstanceOf<InicioController>());
    });

    test("Set Value", () {
      expect(inicio.value, equals(0));
      inicio.increment();
      expect(inicio.value, equals(1));
    });
  });
}
