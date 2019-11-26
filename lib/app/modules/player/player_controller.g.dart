// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerController on _PlayerBase, Store {
  final _$iconAtom = Atom(name: '_PlayerBase.icon');

  @override
  IconData get icon {
    _$iconAtom.context.enforceReadPolicy(_$iconAtom);
    _$iconAtom.reportObserved();
    return super.icon;
  }

  @override
  set icon(IconData value) {
    _$iconAtom.context.conditionallyRunInAction(() {
      super.icon = value;
      _$iconAtom.reportChanged();
    }, _$iconAtom, name: '${_$iconAtom.name}_set');
  }

  final _$playAsyncAction = AsyncAction('play');

  @override
  Future play() {
    return _$playAsyncAction.run(() => super.play());
  }

  final _$backAsyncAction = AsyncAction('back');

  @override
  Future back() {
    return _$backAsyncAction.run(() => super.back());
  }
}
