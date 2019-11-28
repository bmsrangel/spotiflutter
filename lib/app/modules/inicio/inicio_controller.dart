import 'package:mobx/mobx.dart';

part 'inicio_controller.g.dart';

class InicioController = _InicioBase with _$InicioController;

abstract class _InicioBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
