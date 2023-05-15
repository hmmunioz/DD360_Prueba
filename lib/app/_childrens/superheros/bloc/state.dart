part of 'bloc.dart';

abstract class State extends Equatable {
  const State(this.model);

  final Model model;

  @override
  List<Object?> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class LoadingSuperHerosState extends State {
  const LoadingSuperHerosState(Model model) : super(model);
}

class LoadedSuperHerosState extends State {
  const LoadedSuperHerosState(Model model) : super(model);
}

class LoadingMoreSuperHerosState extends State {
  const LoadingMoreSuperHerosState(Model model) : super(model);
}

class ErrorState extends State {
  const ErrorState(Model model) : super(model);
}

class SelectFilterState extends State {
  const SelectFilterState(Model model) : super(model);
}

class GetComicsState extends State {
  const GetComicsState(Model model) : super(model);
}

class LoadingComicsState extends State {
  const LoadingComicsState(Model model) : super(model);
}

class LoadedComicsState extends State {
  const LoadedComicsState(Model model) : super(model);
}

class LoadingMoreComicsState extends State {
  const LoadingMoreComicsState(Model model) : super(model);
}

class GetEventsState extends State {
  const GetEventsState(Model model) : super(model);
}

class LoadingEventsState extends State {
  const LoadingEventsState(Model model) : super(model);
}

class LoadedEventsState extends State {
  const LoadedEventsState(Model model) : super(model);
}

class LoadingMoreEventsState extends State {
  const LoadingMoreEventsState(Model model) : super(model);
}

class GetStoriesState extends State {
  const GetStoriesState(Model model) : super(model);
}

class LoadingStoriesState extends State {
  const LoadingStoriesState(Model model) : super(model);
}

class LoadedStoriesState extends State {
  const LoadedStoriesState(Model model) : super(model);
}

class LoadingMoreStoriesState extends State {
  const LoadingMoreStoriesState(Model model) : super(model);
}

class GetSeriesState extends State {
  const GetSeriesState(Model model) : super(model);
}

class LoadingSeriesState extends State {
  const LoadingSeriesState(Model model) : super(model);
}

class LoadedSeriesState extends State {
  const LoadedSeriesState(Model model) : super(model);
}

class LoadingMoreSeriesState extends State {
  const LoadingMoreSeriesState(Model model) : super(model);
}

class ShowLoaderState extends State {
  const ShowLoaderState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.limit = 10,
    this.countSuperheros = 0,
    this.totalSuperheros = 0,
    this.offsetSuperheros = 0,
    this.countSeries = 0,
    this.totalSeries = 0,
    this.offsetSeries = 0,
    this.countStory = 0,
    this.totalStory = 0,
    this.offsetStory = 0,
    this.countComics = 0,
    this.totalComics = 0,
    this.offsetComics = 0,
    this.countEvents = 0,
    this.totalEvents = 0,
    this.offsetEvents = 0,
    this.pageSuperhero = 0,
    this.pageComics = 0,
    this.pageSeries = 0,
    this.pageStories = 0,
    this.pageEvents = 0,
    this.superheroList = const [],
    this.comicsList,
    this.eventList,
    this.seriesList,
    this.storiesList,
    this.currentSuperhero,
    this.showLoaderComics = false,
    this.showListComics = false,
  });
  final int limit;
  final int countSuperheros;
  final int totalSuperheros;
  final int offsetSuperheros;
  final int countComics;
  final int totalComics;
  final int offsetComics;
  final int countEvents;
  final int totalEvents;
  final int offsetEvents;
  final int countStory;
  final int totalStory;
  final int offsetStory;
  final int countSeries;
  final int totalSeries;
  final int offsetSeries;

  final int pageSuperhero;
  final int pageComics;
  final int pageSeries;
  final int pageStories;
  final int pageEvents;

  final List<SuperheroModel> superheroList;
  final List<Comic>? comicsList;
  final List<EventMarvel>? eventList;
  final List<Series>? seriesList;
  final List<Story>? storiesList;
  final SuperheroModel? currentSuperhero;
  final bool showLoaderComics;
  final bool showListComics;
  Model copyWith({
    int? limit,
    int? countSuperheros,
    int? totalSuperheros,
    int? offsetSuperheros,
    int? countComics,
    int? totalComics,
    int? offsetComics,
    int? countEvents,
    int? totalEvents,
    int? offsetEvents,
    int? countStory,
    int? totalStory,
    int? offsetStory,
    int? countSeries,
    int? totalSeries,
    int? offsetSeries,
    int? pageSuperhero,
    int? pageComics,
    int? pageSeries,
    int? pageStories,
    int? pageEvents,
    List<SuperheroModel>? superheroList,
    List<Comic>? comicsList,
    List<EventMarvel>? eventList,
    List<Series>? seriesList,
    List<Story>? storiesList,
    SuperheroModel? currentSuperhero,
    bool? showLoaderComics,
    bool? showListComics,
  }) {
    return Model(
      superheroList: superheroList ?? this.superheroList,
      limit: limit ?? this.limit,
      countSuperheros: countSuperheros ?? this.countSuperheros,
      totalSuperheros: totalSuperheros ?? this.totalSuperheros,
      offsetSuperheros: offsetSuperheros ?? this.offsetSuperheros,
      countSeries: countSeries ?? this.countSeries,
      totalSeries: totalSeries ?? this.totalSeries,
      offsetSeries: offsetSeries ?? this.offsetSeries,
      countComics: countComics ?? this.countComics,
      totalComics: totalComics ?? this.totalComics,
      offsetComics: offsetComics ?? this.offsetComics,
      countStory: countStory ?? this.countStory,
      totalStory: totalStory ?? this.totalStory,
      offsetStory: offsetStory ?? this.offsetStory,
      countEvents: countEvents ?? this.countEvents,
      totalEvents: totalEvents ?? this.totalEvents,
      offsetEvents: offsetEvents ?? this.offsetEvents,
      pageSuperhero: pageSuperhero ?? this.pageSuperhero,
      pageComics: pageComics ?? this.pageComics,
      pageSeries: pageSeries ?? this.pageSeries,
      pageStories: pageStories ?? this.pageStories,
      pageEvents: pageEvents ?? this.pageEvents,
      eventList: eventList ?? this.eventList,
      seriesList: seriesList ?? this.seriesList,
      storiesList: storiesList ?? this.storiesList,
      comicsList: comicsList ?? this.comicsList,
      currentSuperhero: currentSuperhero ?? this.currentSuperhero,
      showLoaderComics: showLoaderComics ?? this.showLoaderComics,
      showListComics: showListComics ?? this.showListComics,
    );
  }

  @override
  List<Object?> get props => [
        superheroList,
        limit,
        countSuperheros,
        totalSuperheros,
        offsetSuperheros,
        countComics,
        totalComics,
        offsetComics,
        countSeries,
        totalSeries,
        offsetSeries,
        countStory,
        totalStory,
        offsetStory,
        countEvents,
        totalEvents,
        offsetEvents,
        pageSuperhero,
        pageComics,
        pageSeries,
        pageEvents,
        comicsList,
        eventList,
        seriesList,
        storiesList,
        currentSuperhero,
        showLoaderComics,
        showListComics,
      ];
}
