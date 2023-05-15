import 'package:dd360_test/app/models/marvel_models/entity_model.dart';
import 'package:dd360_test/app/models/marvel_models/thumbail_model.dart';
import 'package:dd360_test/app/models/marvel_models/url_model.dart';
import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final int id;
  final String title;
  final String description;
  final String resourceURI;
  final List<Url> urls;
  final int startYear;
  final int endYear;
  final String rating;
  final DateTime modified;
  final Thumbnail thumbnail;
  final EntityList comics;
  final EntityList stories;
  final EntityList events;
  final EntityList characters;
  final EntityList creators;
  final EntitySummary? next;
  final EntitySummary? previous;

  const Series({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceURI,
    required this.urls,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.modified,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.characters,
    required this.creators,
    required this.next,
    required this.previous,
  });

  Series copyWith({
    int? id,
    String? title,
    String? description,
    String? resourceURI,
    List<Url>? urls,
    int? startYear,
    int? endYear,
    String? rating,
    DateTime? modified,
    Thumbnail? thumbnail,
    EntityList? comics,
    EntityList? stories,
    EntityList? events,
    EntityList? characters,
    EntityList? creators,
    EntitySummary? next,
    EntitySummary? previous,
  }) {
    return Series(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      resourceURI: resourceURI ?? this.resourceURI,
      urls: urls ?? this.urls,
      startYear: startYear ?? this.startYear,
      endYear: endYear ?? this.endYear,
      rating: rating ?? this.rating,
      modified: modified ?? this.modified,
      thumbnail: thumbnail ?? this.thumbnail,
      comics: comics ?? this.comics,
      stories: stories ?? this.stories,
      events: events ?? this.events,
      characters: characters ?? this.characters,
      creators: creators ?? this.creators,
      next: next ?? this.next,
      previous: previous ?? this.previous,
    );
  }

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
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
      startYear: json['startYear'] ?? 0,
      endYear: json['endYear'] ?? 0,
      rating: json['rating'] ?? '',
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
      stories: json['stories'] != null
          ? EntityList.fromJson(json['stories'])
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
      next: json['next'] != null ? EntitySummary.fromJson(json['next']) : null,
      previous: json['previous'] != null
          ? EntitySummary.fromJson(json['previous'])
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'resourceURI': resourceURI,
      'urls': urls.map((url) => url.toJson()).toList(),
      'startYear': startYear,
      'endYear': endYear,
      'rating': rating,
      'modified': modified.toIso8601String(),
      'thumbnail': thumbnail.toJson(),
      'comics': comics.toJson(),
      'stories': stories.toJson(),
      'events': events.toJson(),
      'characters': characters.toJson(),
      'creators': creators.toJson(),
      'next': next!.toJson(),
      'previous': previous!.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceURI,
        urls,
        startYear,
        endYear,
        rating,
        modified,
        thumbnail,
        comics,
        stories,
        events,
        characters,
        creators,
        next,
        previous,
      ];
}
