import 'package:mobx/mobx.dart';
import 'package:spotiflutter/app/app_module.dart';
import 'package:spotiflutter/app/models/artist_model.dart';
import 'package:spotiflutter/app/repositories/hasura_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final connection = AppModule.to.get<HasuraRepository>();
  @observable
  ObservableList<ArtistModel> artists = ObservableList<ArtistModel>();

  @action
  getArtists() async {
    var tempArtists = await connection.getArtists();
    artists.addAll(tempArtists);
    print(artists.length);
  }
}
