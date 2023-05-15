import 'package:dd360_test/app/enums/marvel/superhero_filter_enum.dart';
import 'package:dd360_test/app/models/marvel_models/comic_model.dart';
import 'package:dd360_test/app/models/marvel_models/event_model.dart';
import 'package:dd360_test/app/models/marvel_models/serie_model.dart';
import 'package:dd360_test/app/models/marvel_models/story_model.dart';
import 'package:equatable/equatable.dart';

import '../marvel_models/superhero_model.dart';

class ResultMarvelListModel extends Equatable {
  final int count;
  final int limit;
  final int offset;

  final List<dynamic> results;
  final int total;

  const ResultMarvelListModel({
    required this.count,
    required this.limit,
    required this.offset,
    required this.results,
    required this.total,
  });

  ResultMarvelListModel copyWith({
    int? count,
    int? limit,
    int? offset,
    List<dynamic>? results,
    int? total,
  }) {
    return ResultMarvelListModel(
        count: count ?? this.count,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        results: results ?? this.results,
        total: total ?? this.total);
  }

  factory ResultMarvelListModel.fromJson(
      Map<String, dynamic> json, MarvelEnum marvelEnum) {
    dynamic resultList;
    switch (marvelEnum) {
      case MarvelEnum.superhero:
        resultList = List<SuperheroModel>.from(
            json['data']["results"].map((x) => SuperheroModel.fromJson(x)));
        break;
      case MarvelEnum.comic:
        resultList = List<Comic>.from(
            json['data']["results"].map((x) => Comic.fromJson(x)));
        break;

      case MarvelEnum.event:
        resultList = List<EventMarvel>.from(
            json['data']["results"].map((x) => EventMarvel.fromJson(x)));
        break;

      case MarvelEnum.serie:
        resultList = List<Series>.from(
            json['data']["results"].map((x) => Series.fromJson(x)));
        break;

      case MarvelEnum.story:
        resultList = List<Story>.from(
            json['data']["results"].map((x) => Story.fromJson(x)));
        break;

      default:
    }

    return ResultMarvelListModel(
      count: json['data']['count'] ?? 0,
      limit: json['data']['limit'] ?? 0,
      offset: json['data']['offset'] ?? 0,
      results: resultList,
      total: json['data']['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'limit': limit,
      'offset': offset,
      'results': results,
      'total': total,
    };
  }

  @override
  List<Object?> get props => [
        count,
        limit,
        offset,
        results,
        total,
      ];
}
