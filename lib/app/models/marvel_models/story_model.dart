import 'package:dd360_test/app/models/marvel_models/entity_model.dart';
import 'package:dd360_test/app/models/marvel_models/thumbail_model.dart';
import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final int id;
  final String title;
  final String description;
  final String resourceURI;
  final String type;
  final DateTime modified;
  final Thumbnail thumbnail;
  final EntityList comics;
  final EntityList series;
  final EntityList events;
  final EntityList characters;
  final EntityList creators;
  final EntitySummary originalIssue;

  const Story({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceURI,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.comics,
    required this.series,
    required this.events,
    required this.characters,
    required this.creators,
    required this.originalIssue,
  });

  Story copyWith({
    int? id,
    String? title,
    String? description,
    String? resourceURI,
    String? type,
    DateTime? modified,
    Thumbnail? thumbnail,
    EntityList? comics,
    EntityList? series,
    EntityList? events,
    EntityList? characters,
    EntityList? creators,
    EntitySummary? originalIssue,
  }) {
    return Story(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      resourceURI: resourceURI ?? this.resourceURI,
      type: type ?? this.type,
      modified: modified ?? this.modified,
      thumbnail: thumbnail ?? this.thumbnail,
      comics: comics ?? this.comics,
      series: series ?? this.series,
      events: events ?? this.events,
      characters: characters ?? this.characters,
      creators: creators ?? this.creators,
      originalIssue: originalIssue ?? this.originalIssue,
    );
  }

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] != null && json['description'] != ''
          ? json['description']
          : 'No description found',
      resourceURI: json['resourceURI'] ?? '',
      type: json['type'] ?? '',
      modified: json['modified'] != null
          ? DateTime.parse(json['modified'])
          : DateTime.now(),
      thumbnail: json['thumbnail'] != null
          ? Thumbnail.fromJson(json['thumbnail'])
          : const Thumbnail(extension: '', path: ''),
      comics: json['comics'] != null
          ? EntityList.fromJson(json['comics'])
          : const EntityList(
              collectionURI: '', items: [], returned: 0, available: 0),
      series: json['series'] != null
          ? EntityList.fromJson(json['series'])
          : const EntityList(
              collectionURI: '', items: [], returned: 0, available: 0),
      events: json['events'] != null
          ? EntityList.fromJson(json['events'])
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
      originalIssue: json['originalissue'] != null
          ? EntitySummary.fromJson(json['originalissue'])
          : const EntitySummary(resourceURI: '', name: ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'resourceURI': resourceURI,
      'type': type,
      'modified': modified.toIso8601String(),
      'thumbnail': thumbnail.toJson(),
      'comics': comics.toJson(),
      'series': series.toJson(),
      'events': events.toJson(),
      'characters': characters.toJson(),
      'creators': creators.toJson(),
      'originalissue': originalIssue.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceURI,
        type,
        modified,
        thumbnail,
        comics,
        series,
        events,
        characters,
        creators,
        originalIssue,
      ];
}
