import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:spotiflutter/app/models/album_model.dart';
import 'package:spotiflutter/app/models/artist_model.dart';
import 'package:spotiflutter/app/models/track_model.dart';

class HasuraRepository extends Disposable {
  final HasuraConnect connection;

  HasuraRepository(this.connection);

  Future<List<ArtistModel>> getArtists() async {
    String query = """
      query {
        artists {
          id
          name
        }
      }
    """;

    var data = await connection.query(query);
    List artists = data["data"]["artists"];
    return artists.map((artist) => ArtistModel.fromJson(artist)).toList();
  }

  Future<List<AlbumModel>> getAlbumsByArtist(int idArtist) async {
    String query = """
      getAlbumsByArtist(\$id:Int!) {
        albums(where: {id_artist: {_eq: \$id}}) {
          id
          name
        }
      }
    """;

    var data = await connection.query(query, variables: {"id": idArtist});
    List albums = data["data"]["albums"];
    return albums.map((album) => AlbumModel.fromJson(album)).toList();
  }

  Future<List<TrackModel>> getTracksByAlbum(int idAlbum) async {
    String query = """
      query getTracksByAlbum(\$id:Int!) {
        tracks(where: {album: {id: {_eq: \$id}}}) {
          id
          downloadUrl
          coverUrl
          name
          track_number
        }
      }

    """;

    var data = await connection.query(query, variables: {"id": idAlbum});
    List tracks = data["data"]["tracks"];
    return tracks.map((track) => TrackModel.fromJson(track)).toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
