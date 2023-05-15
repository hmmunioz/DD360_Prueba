part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class GetSuperheroEvent extends Event {}

class ReloadSuperheroEvent extends Event {}

class GetMoreSuperheroEvent extends Event {}

class GetEventsEvent extends Event {
  final SuperheroModel superheroModel;
  const GetEventsEvent(
    this.superheroModel,
  );
}

class ReloadEventsEvent extends Event {
  final SuperheroModel superheroModel;
  const ReloadEventsEvent(
    this.superheroModel,
  );
}

class GetMoreEventsEvent extends Event {
  final SuperheroModel superheroModel;
  const GetMoreEventsEvent(
    this.superheroModel,
  );
}

class GetSeriesEvent extends Event {
  final SuperheroModel superheroModel;
  const GetSeriesEvent(
    this.superheroModel,
  );
}

class ReloadSeriesEvent extends Event {
  final SuperheroModel superheroModel;
  const ReloadSeriesEvent(
    this.superheroModel,
  );
}

class GetMoreSeriesEvent extends Event {
  final SuperheroModel superheroModel;
  const GetMoreSeriesEvent(
    this.superheroModel,
  );
}

class GetComicsEvent extends Event {
  final SuperheroModel superheroModel;
  const GetComicsEvent(
    this.superheroModel,
  );
}

class ReloadComicsEvent extends Event {
  final SuperheroModel superheroModel;
  const ReloadComicsEvent(
    this.superheroModel,
  );
}

class GetMoreComicsEvent extends Event {
  final SuperheroModel superheroModel;
  const GetMoreComicsEvent(
    this.superheroModel,
  );
}

class GetStoriesEvent extends Event {
  final SuperheroModel superheroModel;
  const GetStoriesEvent(
    this.superheroModel,
  );
}

class ReloadStoriesEvent extends Event {
  final SuperheroModel superheroModel;
  const ReloadStoriesEvent(
    this.superheroModel,
  );
}

class GetMoreStoriesEvent extends Event {
  final SuperheroModel superheroModel;
  const GetMoreStoriesEvent(
    this.superheroModel,
  );
}
