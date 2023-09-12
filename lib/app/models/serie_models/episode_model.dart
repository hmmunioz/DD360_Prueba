import 'package:equatable/equatable.dart';

class EpisodeResulModel extends Equatable {
  final String title;
  final String season;
  final String totalSeasons;
  final List<EpisodeModel> episodes;
  final String response;

  const EpisodeResulModel({
    required this.title,
    required this.season,
    required this.totalSeasons,
    required this.episodes,
    required this.response,
  });

  factory EpisodeResulModel.fromJson(Map<String, dynamic> json) {
    return EpisodeResulModel(
      title: json['Title'],
      season: json['Season'],
      totalSeasons: json['totalSeasons'],
      episodes: (json['Episodes'] as List)
          .map((episodeJson) => EpisodeModel.fromJson(episodeJson))
          .toList(),
      response: json['Response'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        season,
        totalSeasons,
        episodes,
        response,
      ];
}

class EpisodeModel extends Equatable {
  final String title;
  final String released;
  final String episode;
  final String imdbRating;
  final String imdbID;

  EpisodeModel({
    required this.title,
    required this.released,
    required this.episode,
    required this.imdbRating,
    required this.imdbID,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      title: json['Title'],
      released: json['Released'],
      episode: json['Episode'],
      imdbRating: json['imdbRating'],
      imdbID: json['imdbID'],
    );
  }

  @override
  List<Object?> get props => [title, released, episode, imdbRating, imdbID];
}
