import 'package:mobx/mobx.dart';
import 'package:spotiflutter/app/app_module.dart';
import 'package:spotiflutter/app/models/album_model.dart';
import 'package:spotiflutter/app/repositories/hasura_repository.dart';

part 'albums_controller.g.dart';

class AlbumsController = _AlbumsBase with _$AlbumsController;

abstract class _AlbumsBase with Store {
  final connection = AppModule.to.get<HasuraRepository>();

  @observable
  ObservableList<AlbumModel> albums = ObservableList<AlbumModel>();

  @action
  getAlbumsByArtist(idArtist) async {
    var tempAlbums = await connection.getAlbumsByArtist(idArtist);
    albums.addAll(tempAlbums);
  }
}
