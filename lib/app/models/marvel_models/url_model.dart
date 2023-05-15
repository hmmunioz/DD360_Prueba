import 'package:equatable/equatable.dart';

class Url extends Equatable {
  final String type;
  final String url;

  const Url({
    required this.type,
    required this.url,
  });

  Url copyWith({
    String? type,
    String? url,
  }) {
    return Url(
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      type: json['type'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [
        type,
        url,
      ];
}
