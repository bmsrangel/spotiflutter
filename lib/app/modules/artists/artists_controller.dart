import 'package:mobx/mobx.dart';
import 'package:spotiflutter/app/app_module.dart';
import 'package:spotiflutter/app/models/artist_model.dart';
import 'package:spotiflutter/app/repositories/hasura_repository.dart';

part 'artists_controller.g.dart';

class ArtistsController = _ArtistsBase with _$ArtistsController;

abstract class _ArtistsBase with Store {
  final connection = AppModule.to.get<HasuraRepository>();
  ArtistModel selectedArtist;

  @observable
  ObservableList<ArtistModel> artists = ObservableList<ArtistModel>();

  @action
  getArtists() async {
    var tempArtists = await connection.getArtists();
    artists.addAll(tempArtists);
    print(artists);
  }
}
