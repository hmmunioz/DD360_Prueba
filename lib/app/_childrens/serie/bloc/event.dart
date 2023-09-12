part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class GetSeriesEvent extends Event {
  final String search;
  const GetSeriesEvent(
    this.search,
  );
}

class GetSeasonEvent extends Event {}

class GetEpisodeEvent extends Event {}
