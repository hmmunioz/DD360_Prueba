import 'package:equatable/equatable.dart';

class EntitySummary extends Equatable {
  final String resourceURI;
  final String name;

  const EntitySummary({
    required this.resourceURI,
    required this.name,
  });

  factory EntitySummary.fromJson(Map<String, dynamic> json) {
    return EntitySummary(
      resourceURI: json['resourceURI'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [
        resourceURI,
        name,
      ];
}

class EntityList extends Equatable {
  final int available;
  final int returned;
  final String collectionURI;
  final List<EntitySummary> items;

  const EntityList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  factory EntityList.fromJson(Map<String, dynamic> json) {
    final itemList = List<EntitySummary>.from(
        json['items'].map((x) => EntitySummary.fromJson(x)));

    return EntityList(
      available: json['available'] ?? 0,
      returned: json['returned'] ?? 0,
      collectionURI: json['collectionURI'] ?? '',
      items: itemList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'returned': returned,
      'collectionURI': collectionURI,
      'items': items.map((comic) => comic.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        available,
        returned,
        collectionURI,
        items,
      ];
}
