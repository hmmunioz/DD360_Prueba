import 'package:dd360_test/app/models/marvel_models/entity_model.dart';
import 'package:dd360_test/app/models/marvel_models/text_object_model.dart';
import 'package:dd360_test/app/models/marvel_models/thumbail_model.dart';
import 'package:dd360_test/app/models/marvel_models/url_model.dart';
import 'package:equatable/equatable.dart';

class Comic extends Equatable {
  final int id;
  final int digitalId;
  final String title;
  final double issueNumber;
  final String variantDescription;
  final String description;
  final DateTime modified;
  final String isbn;
  final String upc;
  final String diamondCode;
  final String ean;
  final String issn;
  final String format;
  final int pageCount;
  final List<TextObject> textObjects;
  final String resourceURI;
  final List<Url> urls;
  final EntitySummary series;
  final List<EntitySummary> variants;
  final List<EntitySummary> collections;
  final List<EntitySummary> collectedIssues;
  final List<ComicDate> dates;
  final List<ComicPrice> prices;
  final Thumbnail thumbnail;
  final List<Thumbnail> images;
  final EntityList creators;
  final EntityList characters;
  final EntityList stories;
  final EntityList events;

  const Comic({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceURI,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  Comic copyWith({
    int? id,
    int? digitalId,
    String? title,
    double? issueNumber,
    String? variantDescription,
    String? description,
    DateTime? modified,
    String? isbn,
    String? upc,
    String? diamondCode,
    String? ean,
    String? issn,
    String? format,
    int? pageCount,
    List<TextObject>? textObjects,
    String? resourceURI,
    List<Url>? urls,
    EntitySummary? series,
    List<EntitySummary>? variants,
    List<EntitySummary>? collections,
    List<EntitySummary>? collectedIssues,
    List<ComicDate>? dates,
    List<ComicPrice>? prices,
    Thumbnail? thumbnail,
    List<Thumbnail>? images,
    EntityList? creators,
    EntityList? characters,
    EntityList? stories,
    EntityList? events,
  }) {
    return Comic(
      id: id ?? this.id,
      digitalId: digitalId ?? this.digitalId,
      title: title ?? this.title,
      issueNumber: issueNumber ?? this.issueNumber,
      variantDescription: variantDescription ?? this.variantDescription,
      description: description ?? this.description,
      modified: modified ?? this.modified,
      isbn: isbn ?? this.isbn,
      upc: upc ?? this.upc,
      diamondCode: diamondCode ?? this.diamondCode,
      ean: ean ?? this.ean,
      issn: issn ?? this.issn,
      format: format ?? this.format,
      pageCount: pageCount ?? this.pageCount,
      textObjects: textObjects ?? this.textObjects,
      resourceURI: resourceURI ?? this.resourceURI,
      urls: urls ?? this.urls,
      series: series ?? this.series,
      variants: variants ?? this.variants,
      collections: collections ?? this.collections,
      collectedIssues: collectedIssues ?? this.collectedIssues,
      dates: dates ?? this.dates,
      prices: prices ?? this.prices,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
      creators: creators ?? this.creators,
      characters: characters ?? this.characters,
      stories: stories ?? this.stories,
      events: events ?? this.events,
    );
  }

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      id: json['id'] ?? 0,
      digitalId: json['digitalId'] ?? 0,
      title: json['title'] ?? '',
      issueNumber: json['issueNumber']?.toDouble() ?? 0.0,
      variantDescription: json['variantDescription'] ?? '',
      description: json['description'] ?? '',
      modified: DateTime.tryParse(json['modified'] ?? '') ?? DateTime(0),
      isbn: json['isbn'] ?? '',
      upc: json['upc'] ?? '',
      diamondCode: json['diamondCode'] ?? '',
      ean: json['ean'] ?? '',
      issn: json['issn'] ?? '',
      format: json['format'] ?? '',
      pageCount: json['pageCount'] ?? 0,
      textObjects: (json['textObjects'] as List<dynamic>?)
              ?.map((item) => TextObject.fromJson(item))
              .toList() ??
          [],
      resourceURI: json['resourceURI'] ?? '',
      urls: (json['urls'] as List<dynamic>?)
              ?.map((item) => Url.fromJson(item))
              .toList() ??
          [],
      series: EntitySummary.fromJson(json['series'] ?? {}),
      variants: (json['variants'] as List<dynamic>?)
              ?.map((item) => EntitySummary.fromJson(item))
              .toList() ??
          [],
      collections: (json['collections'] as List<dynamic>?)
              ?.map((item) => EntitySummary.fromJson(item))
              .toList() ??
          [],
      collectedIssues: (json['collectedIssues'] as List<dynamic>?)
              ?.map((item) => EntitySummary.fromJson(item))
              .toList() ??
          [],
      dates: (json['dates'] as List<dynamic>?)
              ?.map((item) => ComicDate.fromJson(item))
              .toList() ??
          [],
      prices: (json['prices'] as List<dynamic>?)
              ?.map((item) => ComicPrice.fromJson(item))
              .toList() ??
          [],
      thumbnail: Thumbnail.fromJson(json['thumbnail'] ?? {}),
      images: (json['images'] as List<dynamic>?)
              ?.map((item) => Thumbnail.fromJson(item))
              .toList() ??
          [],
      creators: EntityList.fromJson(json['creators'] ?? {}),
      characters: EntityList.fromJson(json['characters'] ?? {}),
      stories: EntityList.fromJson(json['stories'] ?? {}),
      events: EntityList.fromJson(json['events'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'digitalId': digitalId,
      'title': title,
      'issueNumber': issueNumber,
      'variantDescription': variantDescription,
      'description': description,
      'modified': modified.toIso8601String(),
      'isbn': isbn,
      'upc': upc,
      'diamondCode': diamondCode,
      'ean': ean,
      'issn': issn,
      'format': format,
      'pageCount': pageCount,
      'textObjects': textObjects.map((item) => item.toJson()).toList(),
      'resourceURI': resourceURI,
      'urls': urls.map((item) => item.toJson()).toList(),
      'series': series.toJson(),
      'variants': variants.map((item) => item.toJson()).toList(),
      'collections': collections.map((item) => item.toJson()).toList(),
      'collectedIssues': collectedIssues.map((item) => item.toJson()).toList(),
      'dates': dates.map((item) => item.toJson()).toList(),
      'prices': prices.map((item) => item.toJson()).toList(),
      'thumbnail': thumbnail.toJson(),
      'images': images.map((item) => item.toJson()).toList(),
      'creators': creators.toJson(),
      'characters': characters.toJson(),
      'stories': stories.toJson(),
      'events': events.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        digitalId,
        title,
        issueNumber,
        variantDescription,
        description,
        modified,
        isbn,
        upc,
        diamondCode,
        ean,
        issn,
        format,
        pageCount,
        textObjects,
        resourceURI,
        urls,
        series,
        variants,
        collections,
        collectedIssues,
        dates,
        prices,
        thumbnail,
        images,
        creators,
        characters,
        stories,
        events,
      ];
}

class ComicDate extends Equatable {
  final String type;
  final DateTime date;

  const ComicDate({
    required this.type,
    required this.date,
  });

  ComicDate copyWith({
    String? type,
    DateTime? date,
  }) {
    return ComicDate(
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  factory ComicDate.fromJson(Map<String, dynamic> json) {
    return ComicDate(
      type: json['type'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime(0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'date': date.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        type,
        date,
      ];
}

class ComicPrice extends Equatable {
  final String type;
  final double price;

  const ComicPrice({
    required this.type,
    required this.price,
  });

  ComicPrice copyWith({
    String? type,
    double? price,
  }) {
    return ComicPrice(
      type: type ?? this.type,
      price: price ?? this.price,
    );
  }

  factory ComicPrice.fromJson(Map<String, dynamic> json) {
    return ComicPrice(
      type: json['type'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [
        type,
        price,
      ];
}
