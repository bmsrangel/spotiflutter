import 'package:mobx/mobx.dart';
import 'package:spotiflutter/app/app_module.dart';
import 'package:spotiflutter/app/models/artist_model.dart';
import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_module.dart';
import 'package:spotiflutter/app/repositories/hasura_repository.dart';

part 'inicio_controller.g.dart';

class InicioController = _InicioBase with _$InicioController;

abstract class _InicioBase with Store {
  final connection = AppModule.to.get<HasuraRepository>();

  @observable
  ObservableList<ArtistModel> artistList = ObservableList<ArtistModel>();

  @action
  getRecentArtists() async {
    var tempList = await connection.getArtists();
    artistList.addAll(tempList);
    print(artistList);
  }
}
