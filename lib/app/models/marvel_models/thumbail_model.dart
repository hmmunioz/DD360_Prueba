import 'package:equatable/equatable.dart';

class Thumbnail extends Equatable {
  final String path;
  final String extension;

  const Thumbnail({
    required this.path,
    required this.extension,
  });

  Thumbnail copyWith({
    String? path,
    String? extension,
  }) {
    return Thumbnail(
      path: path ?? this.path,
      extension: extension ?? this.extension,
    );
  }

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      path: json['path'] ?? '',
      extension: json['extension'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'extension': extension,
    };
  }

  @override
  List<Object?> get props => [
        path,
        extension,
      ];
}
