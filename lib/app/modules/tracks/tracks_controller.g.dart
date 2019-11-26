// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TracksController on _TracksBase, Store {
  final _$tracksAtom = Atom(name: '_TracksBase.tracks');

  @override
  ObservableList<TrackModel> get tracks {
    _$tracksAtom.context.enforceReadPolicy(_$tracksAtom);
    _$tracksAtom.reportObserved();
    return super.tracks;
  }

  @override
  set tracks(ObservableList<TrackModel> value) {
    _$tracksAtom.context.conditionallyRunInAction(() {
      super.tracks = value;
      _$tracksAtom.reportChanged();
    }, _$tracksAtom, name: '${_$tracksAtom.name}_set');
  }

  final _$getTracksByAlbumAsyncAction = AsyncAction('getTracksByAlbum');

  @override
  Future getTracksByAlbum(int idAlbum) {
    return _$getTracksByAlbumAsyncAction
        .run(() => super.getTracksByAlbum(idAlbum));
  }
}
