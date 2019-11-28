import 'package:mobx/mobx.dart';
import 'package:spotiflutter/app/models/artist_model.dart';
import 'package:spotiflutter/app/modules/artists/artists_controller.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_module.dart';

part 'inicio_controller.g.dart';

class InicioController = _InicioBase with _$InicioController;

abstract class _InicioBase with Store {
  final artistsController = InicioModule.to.bloc<ArtistsController>();

  @observable
  ObservableList<ArtistModel> artistList = ObservableList<ArtistModel>();

  getArtists() async {
    await artistsController.getArtists();
  }
}
