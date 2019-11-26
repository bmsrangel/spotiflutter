// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerController on _PlayerBase, Store {
  final _$currentTrackAtom = Atom(name: '_PlayerBase.currentTrack');

  @override
  TrackModel get currentTrack {
    _$currentTrackAtom.context.enforceReadPolicy(_$currentTrackAtom);
    _$currentTrackAtom.reportObserved();
    return super.currentTrack;
  }

  @override
  set currentTrack(TrackModel value) {
    _$currentTrackAtom.context.conditionallyRunInAction(() {
      super.currentTrack = value;
      _$currentTrackAtom.reportChanged();
    }, _$currentTrackAtom, name: '${_$currentTrackAtom.name}_set');
  }

  final _$currentDurationAtom = Atom(name: '_PlayerBase.currentDuration');

  @override
  Duration get currentDuration {
    _$currentDurationAtom.context.enforceReadPolicy(_$currentDurationAtom);
    _$currentDurationAtom.reportObserved();
    return super.currentDuration;
  }

  @override
  set currentDuration(Duration value) {
    _$currentDurationAtom.context.conditionallyRunInAction(() {
      super.currentDuration = value;
      _$currentDurationAtom.reportChanged();
    }, _$currentDurationAtom, name: '${_$currentDurationAtom.name}_set');
  }

  final _$currentPositionAtom = Atom(name: '_PlayerBase.currentPosition');

  @override
  Duration get currentPosition {
    _$currentPositionAtom.context.enforceReadPolicy(_$currentPositionAtom);
    _$currentPositionAtom.reportObserved();
    return super.currentPosition;
  }

  @override
  set currentPosition(Duration value) {
    _$currentPositionAtom.context.conditionallyRunInAction(() {
      super.currentPosition = value;
      _$currentPositionAtom.reportChanged();
    }, _$currentPositionAtom, name: '${_$currentPositionAtom.name}_set');
  }

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
