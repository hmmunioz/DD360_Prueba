enum MarvelEnum {
  superhero,
  comic,
  serie,
  story,
  event,
}

extension MarvelEnumExtension on MarvelEnum {
  String get value {
    switch (this) {
      case MarvelEnum.superhero:
        return 'SuperHero';
      case MarvelEnum.comic:
        return 'Comic';
      case MarvelEnum.serie:
        return 'Serie';
      case MarvelEnum.story:
        return 'Story';
      case MarvelEnum.event:
        return 'Event';
      default:
        return '';
    }
  }
}
