import 'package:mobx/mobx.dart';
import 'package:spotiflutter/app/app_module.dart';
import 'package:spotiflutter/app/models/track_model.dart';
import 'package:spotiflutter/app/repositories/hasura_repository.dart';

part 'tracks_controller.g.dart';

class TracksController = _TracksBase with _$TracksController;

abstract class _TracksBase with Store {
  final connection = AppModule.to.get<HasuraRepository>();
  TrackModel selectedTrack;

  @observable
  ObservableList<TrackModel> tracks = ObservableList<TrackModel>();

  @action
  getTracksByAlbum(int idAlbum) async {
    var tempTracks = await connection.getTracksByAlbum(idAlbum);
    tracks.addAll(tempTracks);
  }
}
