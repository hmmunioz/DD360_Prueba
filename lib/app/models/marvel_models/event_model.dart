import 'package:dd360_test/app/models/marvel_models/entity_model.dart';
import 'package:dd360_test/app/models/marvel_models/thumbail_model.dart';
import 'package:dd360_test/app/models/marvel_models/url_model.dart';
import 'package:equatable/equatable.dart';

class EventMarvel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String resourceURI;
  final List<Url> urls;
  final DateTime modified;
  final DateTime start;
  final DateTime end;
  final Thumbnail thumbnail;
  final EntityList comics;
  final EntityList stories;
  final EntityList series;
  final EntityList characters;
  final EntityList creators;
  final EntitySummary next;
  final EntitySummary previous;

  const EventMarvel({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceURI,
    required this.urls,
    required this.modified,
    required this.start,
    required this.end,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.series,
    required this.characters,
    required this.creators,
    required this.next,
    required this.previous,
  });

  EventMarvel copyWith({
    int? id,
    String? title,
    String? description,
    String? resourceURI,
    List<Url>? urls,
    DateTime? modified,
    DateTime? start,
    DateTime? end,
    Thumbnail? thumbnail,
    EntityList? comics,
    EntityList? stories,
    EntityList? series,
    EntityList? characters,
    EntityList? creators,
    EntitySummary? next,
    EntitySummary? previous,
  }) {
    return EventMarvel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      resourceURI: resourceURI ?? this.resourceURI,
      urls: urls ?? this.urls,
      modified: modified ?? this.modified,
      start: start ?? this.start,
      end: end ?? this.end,
      thumbnail: thumbnail ?? this.thumbnail,
      comics: comics ?? this.comics,
      stories: stories ?? this.stories,
      series: series ?? this.series,
      characters: characters ?? this.characters,
      creators: creators ?? this.creators,
      next: next ?? this.next,
      previous: previous ?? this.previous,
    );
  }

  factory EventMarvel.fromJson(Map<String, dynamic> json) {
    return EventMarvel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] != null && json['description'] != ''
          ? json['description']
          : 'No description found',
      resourceURI: json['resourceURI'] ?? '',
      urls: (json['urls'] as List<dynamic>?)
              ?.map((urlJson) => Url.fromJson(urlJson))
              .toList() ??
          [],
      modified: json['modified'] != null
          ? DateTime.parse(json['modified'])
          : DateTime.now(),
      start: json['start'] != null
          ? DateTime.parse(json['start'])
          : DateTime.now(),
      end: json['end'] != null ? DateTime.parse(json['end']) : DateTime.now(),
      thumbnail: json['thumbnail'] != null
          ? Thumbnail.fromJson(json['thumbnail'])
          : const Thumbnail(extension: '', path: ''),
      comics: json['comics'] != null
          ? EntityList.fromJson(json['comics'])
          : const EntityList(
              collectionURI: '', items: [], returned: 0, available: 0),
      stories: json['stories'] != null
          ? EntityList.fromJson(json['stories'])
          : const EntityList(
              collectionURI: '', items: [], returned: 0, available: 0),
      series: json['series'] != null
          ? EntityList.fromJson(json['series'])
          : const EntityList(
              collectionURI: '', items: [], returned: 0, available: 0),
      characters: json['characters'] != null
          ? EntityList.fromJson(json['characters'])
          : const EntityList(
              collectionURI: '', items: [], returned: 0, available: 0),
      creators: json['creators'] != null
          ? EntityList.fromJson(json['creators'])
          : const EntityList(
              collectionURI: '', items: [], returned: 0, available: 0),
      next: json['next'] != null
          ? EntitySummary.fromJson(json['next'])
          : const EntitySummary(resourceURI: '', name: ''),
      previous: json['previous'] != null
          ? EntitySummary.fromJson(json['previous'])
          : const EntitySummary(resourceURI: '', name: ''),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'resourceURI': resourceURI,
      'urls': urls.map((url) => url.toJson()).toList(),
      'modified': modified.toIso8601String(),
      'start': start.toIso8601String(),
      'end': end.toIso8601String(),
      'thumbnail': thumbnail.toJson(),
      'comics': comics.toJson(),
      'stories': stories.toJson(),
      'series': series.toJson(),
      'characters': characters.toJson(),
      'creators': creators.toJson(),
      'next': next.toJson(),
      'previous': previous.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceURI,
        urls,
        modified,
        start,
        end,
        thumbnail,
        comics,
        stories,
        series,
        characters,
        creators,
        next,
        previous,
      ];
}
