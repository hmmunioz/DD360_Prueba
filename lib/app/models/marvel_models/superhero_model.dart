import 'package:dd360_test/app/models/marvel_models/entity_model.dart';
import 'package:dd360_test/app/models/marvel_models/url_model.dart';
import 'package:equatable/equatable.dart';
import 'thumbail_model.dart';

class SuperheroModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final DateTime modified;
  final String resourceURI;
  final List<Url> urls;
  final Thumbnail thumbnail;
  final EntityList comics;
  final EntityList stories;
  final EntityList events;
  final EntityList series;

  const SuperheroModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });

  SuperheroModel copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? modified,
    String? resourceURI,
    List<Url>? urls,
    Thumbnail? thumbnail,
    EntityList? comics,
    EntityList? stories,
    EntityList? events,
    EntityList? series,
  }) {
    return SuperheroModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      modified: modified ?? this.modified,
      resourceURI: resourceURI ?? this.resourceURI,
      urls: urls ?? this.urls,
      thumbnail: thumbnail ?? this.thumbnail,
      comics: comics ?? this.comics,
      stories: stories ?? this.stories,
      events: events ?? this.events,
      series: series ?? this.series,
    );
  }

  factory SuperheroModel.fromJson(Map<String, dynamic> json) {
    final urlsList = List<Url>.from(json['urls'].map((x) => Url.fromJson(x)));
    final thumbnailData = Thumbnail.fromJson(json['thumbnail']);
    final comicsData = EntityList.fromJson(json['comics']);
    final storiesData = EntityList.fromJson(json['stories']);
    final eventsData = EntityList.fromJson(json['events']);
    final seriesData = EntityList.fromJson(json['series']);

    return SuperheroModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] != null && json['description'] != ''
          ? json['description']
          : 'No description found',
      modified: DateTime.parse(json['modified'] ?? ''),
      resourceURI: json['resourceURI'] ?? '',
      urls: urlsList,
      thumbnail: thumbnailData,
      comics: comicsData,
      stories: storiesData,
      events: eventsData,
      series: seriesData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified.toIso8601String(),
      'resourceURI': resourceURI,
      'urls': urls.map((url) => url.toJson()).toList(),
      'thumbnail': thumbnail.toJson(),
      'comics': comics.toJson(),
      'stories': stories.toJson(),
      'events': events.toJson(),
      'series': series.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        modified,
        resourceURI,
        urls,
        thumbnail,
        comics,
        stories,
        events,
        series,
      ];
}
