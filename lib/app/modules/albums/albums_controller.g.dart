// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlbumsController on _AlbumsBase, Store {
  final _$albumsAtom = Atom(name: '_AlbumsBase.albums');

  @override
  ObservableList<AlbumModel> get albums {
    _$albumsAtom.context.enforceReadPolicy(_$albumsAtom);
    _$albumsAtom.reportObserved();
    return super.albums;
  }

  @override
  set albums(ObservableList<AlbumModel> value) {
    _$albumsAtom.context.conditionallyRunInAction(() {
      super.albums = value;
      _$albumsAtom.reportChanged();
    }, _$albumsAtom, name: '${_$albumsAtom.name}_set');
  }

  final _$getAlbumsByArtistAsyncAction = AsyncAction('getAlbumsByArtist');

  @override
  Future getAlbumsByArtist(dynamic idArtist) {
    return _$getAlbumsByArtistAsyncAction
        .run(() => super.getAlbumsByArtist(idArtist));
  }
}
