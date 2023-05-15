import 'package:equatable/equatable.dart';

class TextObject extends Equatable {
  final String type;
  final String language;
  final String text;

  const TextObject({
    required this.type,
    required this.language,
    required this.text,
  });

  TextObject copyWith({
    String? type,
    String? language,
    String? text,
  }) {
    return TextObject(
      type: type ?? this.type,
      language: language ?? this.language,
      text: text ?? this.text,
    );
  }

  factory TextObject.fromJson(Map<String, dynamic> json) {
    return TextObject(
      type: json['type'] ?? '',
      language: json['language'] ?? '',
      text: json['text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'language': language,
      'text': text,
    };
  }

  @override
  List<Object?> get props => [
        type,
        language,
        text,
      ];
}
