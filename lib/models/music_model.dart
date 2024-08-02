// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:music_player/gen/assets.gen.dart';

class Music {
  final int id;
  final String title;
  final String artist;
  final String path;
  Music({
    required this.id,
    required this.title,
    required this.artist,
    required this.path,
  });

  Music copyWith({
    int? id,
    String? title,
    String? artist,
    String? path,
  }) {
    return Music(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'artist': artist,
      'path': path,
    };
  }

  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      id: map['id'] as int,
      title: map['title'] as String,
      artist: map['artist'] as String,
      path: map['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Music.fromJson(String source) =>
      Music.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Music(id: $id, title: $title, artist: $artist, path: $path)';
  }

  @override
  bool operator ==(covariant Music other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.artist == artist &&
        other.path == path;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ artist.hashCode ^ path.hashCode;
  }
}

String getUrlAddress(String fileID) {
  return 'https://www.googleapis.com/drive/v3/files/$fileID?alt=media&key=AIzaSyCAtbRmPnOklzrDRYZe4LBemLzNTjx80pI&v=.mp3';
}

final musicList = <Music>[
  Music(
    id: 0,
    title: 'Gucci Louis - Rap Beat 2',
    artist: 'Ladyfingers',
    path: getUrlAddress('15b--mu6aI1j-kWsCuWWHJjG6uNW0c4cS'),
  ),
  Music(
    id: 1,
    title: ' Sunset Ride',
    artist: 'APO ザ·犬 。',
    path: getUrlAddress('1JSEdASD4FWss2ZbimDQJ7pNBUEl2I9Qw'),
  ),
  Music(
    id: 2,
    title: 'Dream (Girl)',
    artist: 'Slike',
    path: getUrlAddress('1p-4VHzdaqw7goMQ2Gh8hKcTrKoA8e4r8'),
  )
];
