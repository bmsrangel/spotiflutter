// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$artistsAtom = Atom(name: '_HomeBase.artists');

  @override
  ObservableList<ArtistModel> get artists {
    _$artistsAtom.context.enforceReadPolicy(_$artistsAtom);
    _$artistsAtom.reportObserved();
    return super.artists;
  }

  @override
  set artists(ObservableList<ArtistModel> value) {
    _$artistsAtom.context.conditionallyRunInAction(() {
      super.artists = value;
      _$artistsAtom.reportChanged();
    }, _$artistsAtom, name: '${_$artistsAtom.name}_set');
  }

  final _$getArtistsAsyncAction = AsyncAction('getArtists');

  @override
  Future getArtists() {
    return _$getArtistsAsyncAction.run(() => super.getArtists());
  }
}
