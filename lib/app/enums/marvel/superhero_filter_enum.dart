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

  String get plural {
    switch (this) {
      case MarvelEnum.superhero:
        return 'SuperHeros';
      case MarvelEnum.comic:
        return 'Comics';
      case MarvelEnum.serie:
        return 'Series';
      case MarvelEnum.story:
        return 'Stories';
      case MarvelEnum.event:
        return 'Events';
      default:
        return '';
    }
  }
}
