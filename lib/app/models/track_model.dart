class TrackModel {
  String name;
  int trackNumber;
  String downloadUrl;
  String coverUrl;
  int id;
  Duration duration = Duration(milliseconds: 0);
  Duration position = Duration(milliseconds: 0);

  TrackModel(
      {this.name, this.trackNumber, this.downloadUrl, this.coverUrl, this.id});

  TrackModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    trackNumber = json['track_number'];
    downloadUrl = json['downloadUrl'];
    coverUrl = json['coverUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['track_number'] = this.trackNumber;
    data['downloadUrl'] = this.downloadUrl;
    data['coverUrl'] = this.coverUrl;
    data['id'] = this.id;
    return data;
  }
}
