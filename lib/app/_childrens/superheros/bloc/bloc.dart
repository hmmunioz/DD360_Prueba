import 'package:bloc/bloc.dart' as bloc;
import 'package:dd360_test/app/enums/marvel/superhero_filter_enum.dart';
import 'package:dd360_test/app/models/marvel_models/comic_model.dart';
import 'package:dd360_test/app/models/marvel_models/event_model.dart';
import 'package:dd360_test/app/models/marvel_models/serie_model.dart';
import 'package:dd360_test/app/models/marvel_models/story_model.dart';
import 'package:dd360_test/app/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dd360_test/app/models/marvel_models/superhero_model.dart';

import '../../../constants/apiurl.dart';
part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc({Repository? repository})
      : repository = repository ??= Repository(),
        super(const InitialState(Model())) {
    on<GetSuperheroEvent>(_onGetSuperheroEvent);
    on<GetEventsEvent>(_onGetEventsEvent);
    on<GetComicsEvent>(_onGetComicsEvent);
    on<GetSeriesEvent>(_onGetSeriesEvent);
    on<GetStoriesEvent>(_onGetStoriesEvent);
    on<ReloadSuperheroEvent>(_onReloadSuperheroEvent);
    on<GetMoreSuperheroEvent>(_onGetMoreSuperheroEvent);
    on<ReloadComicsEvent>(_onReloadComicsEvent);
    on<GetMoreComicsEvent>(_onGetMoreComicsEvent);
    on<ReloadEventsEvent>(_onReloadEventsEvent);
    on<GetMoreEventsEvent>(_onGetMoreEventsEvent);
    on<ReloadSeriesEvent>(_onReloadSeriesEvent);
    on<GetMoreSeriesEvent>(_onGetMoreSeriesEvent);
    on<ReloadStoriesEvent>(_onReloadStoriesEvent);
    on<GetMoreStoriesEvent>(_onGetMoreStoriesEvent);
  }

  late Repository repository;

  Future<Model> _getSuperheros() async {
    final oldSuperhero = state.model.superheroList;
    List<SuperheroModel> superheroList = [];
    if ((state.model.limit * (state.model.pageSuperhero)) <
            state.model.totalSuperheros ||
        state.model.totalSuperheros == 0) {
      final response = await repository.getEntityMarvelApi(
        ApiUrlValues.apiBaseUrl + ApiUrlValues.getSuperHeros,
        MarvelEnum.superhero,
        page: state.model.pageSuperhero != 0
            ? state.model.limit * state.model.pageSuperhero
            : 0,
      );

      superheroList = [...oldSuperhero, ...response?.results ?? []];

      return state.model.copyWith(
        superheroList: superheroList,
        totalSuperheros: response?.total,
        limit: response?.limit,
        offsetSuperheros: response?.offset,
        countSuperheros: response?.count,
        pageSuperhero: state.model.pageSuperhero + 1,
      );
    }
    return state.model;
  }

  Future<Model> _getComicsByHero(
    SuperheroModel superheroModel,
  ) async {
    final oldComics = state.model.comicsList;
    List<Comic> comicsList = [];
    if ((state.model.limit * (state.model.pageComics)) <
            state.model.totalComics ||
        state.model.totalComics == 0) {
      final response = await repository.getEntityMarvelApi(
        ApiUrlValues.apiBaseUrl +
            ApiUrlValues.getSuperHeros +
            '/' +
            superheroModel.id.toString() +
            ApiUrlValues.getComics,
        MarvelEnum.comic,
        page: state.model.pageComics != 0
            ? state.model.limit * state.model.pageComics
            : 0,
      );
      comicsList = [...oldComics ?? [], ...response?.results ?? []];

      return state.model.copyWith(
        comicsList: comicsList,
        totalComics: response?.total,
        limit: response?.limit,
        offsetComics: response?.offset,
        countComics: response?.count,
        pageComics: state.model.pageComics + 1,
        currentSuperhero: superheroModel,
      );
    }
    return state.model;
  }

  Future<Model> _getEventsByHero(
    SuperheroModel superheroModel,
  ) async {
    final oldEvents = state.model.eventList;
    List<EventMarvel> eventList = [];
    if ((state.model.limit * (state.model.pageEvents)) <
            state.model.totalEvents ||
        state.model.totalEvents == 0) {
      final response = await repository.getEntityMarvelApi(
        ApiUrlValues.apiBaseUrl +
            ApiUrlValues.getSuperHeros +
            '/' +
            superheroModel.id.toString() +
            ApiUrlValues.getEvents,
        MarvelEnum.event,
        page: state.model.pageEvents != 0
            ? state.model.limit * state.model.pageEvents
            : 0,
      );
      eventList = [...oldEvents ?? [], ...response?.results ?? []];

      return state.model.copyWith(
        eventList: eventList,
        totalEvents: response?.total,
        limit: response?.limit,
        offsetEvents: response?.offset,
        countEvents: response?.count,
        pageEvents: state.model.pageEvents + 1,
        currentSuperhero: superheroModel,
      );
    }
    return state.model;
  }

  Future<Model> _getStoriesByHero(
    SuperheroModel superheroModel,
  ) async {
    final oldStories = state.model.storiesList;
    List<Story> storiesList = [];
    if ((state.model.limit * (state.model.pageStories)) <
            state.model.totalStory ||
        state.model.totalStory == 0) {
      final response = await repository.getEntityMarvelApi(
        ApiUrlValues.apiBaseUrl +
            ApiUrlValues.getSuperHeros +
            '/' +
            superheroModel.id.toString() +
            ApiUrlValues.getStories,
        MarvelEnum.story,
        page: state.model.pageStories != 0
            ? state.model.limit * state.model.pageStories
            : 0,
      );
      storiesList = [...oldStories ?? [], ...response?.results ?? []];

      return state.model.copyWith(
        storiesList: storiesList,
        totalStory: response?.total,
        limit: response?.limit,
        offsetStory: response?.offset,
        countStory: response?.count,
        pageStories: state.model.pageStories + 1,
        currentSuperhero: superheroModel,
      );
    }
    return state.model;
  }

  Future<Model> _getSeriesByHero(
    SuperheroModel superheroModel,
  ) async {
    final oldSeries = state.model.seriesList;
    List<Series> seriesList = [];
    if ((state.model.limit * (state.model.pageSeries)) <
            state.model.totalSeries ||
        state.model.totalSeries == 0) {
      final response = await repository.getEntityMarvelApi(
        ApiUrlValues.apiBaseUrl +
            ApiUrlValues.getSuperHeros +
            '/' +
            superheroModel.id.toString() +
            ApiUrlValues.getSeries,
        MarvelEnum.serie,
        page: state.model.pageSeries != 0
            ? state.model.limit * state.model.pageSeries
            : 0,
      );
      seriesList = [...oldSeries ?? [], ...response?.results ?? []];

      return state.model.copyWith(
        seriesList: seriesList,
        totalSeries: response?.total,
        limit: response?.limit,
        offsetSeries: response?.offset,
        countSeries: response?.count,
        pageSeries: state.model.pageSeries + 1,
        currentSuperhero: superheroModel,
      );
    }
    return state.model;
  }

  void _onGetSuperheroEvent(
    GetSuperheroEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingSuperHerosState(state.model));
    try {
      final model = await _getSuperheros();
      emit(LoadedSuperHerosState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onGetMoreSuperheroEvent(
    GetMoreSuperheroEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingMoreSuperHerosState(state.model));
    try {
      final model = await _getSuperheros();
      emit(LoadedSuperHerosState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onReloadSuperheroEvent(
    ReloadSuperheroEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingSuperHerosState(state.model.copyWith(
      superheroList: [],
      comicsList: [],
      eventList: [],
      seriesList: [],
      storiesList: [],
      countComics: 0,
      countEvents: 0,
      countSeries: 0,
      countStory: 0,
      countSuperheros: 0,
      offsetEvents: 0,
      offsetComics: 0,
      offsetSeries: 0,
      offsetStory: 0,
      offsetSuperheros: 0,
      pageSuperhero: 0,
      pageComics: 0,
      pageEvents: 0,
      pageSeries: 0,
      pageStories: 0,
      limit: 10,
    )));
    try {
      final model = await _getSuperheros();

      emit(LoadedSuperHerosState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onGetEventsEvent(
    GetEventsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingEventsState(
      state.model.copyWith(
        showLoaderComics: true,
      ),
    ));
    try {
      final model = await _getEventsByHero(event.superheroModel);
      emit(
        LoadedEventsState(model),
      );
      emit(
        GetEventsState(model.copyWith(
          showListComics: true,
          showLoaderComics: false,
        )),
      );
    } catch (error) {
      emit(
        LoadedEventsState(state.model),
      );
      emit(ErrorState(state.model));
    }
  }

  void _onGetMoreEventsEvent(
    GetMoreEventsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingMoreEventsState(state.model));
    try {
      final model = await _getEventsByHero(event.superheroModel);
      emit(LoadedEventsState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onReloadEventsEvent(
    ReloadEventsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingEventsState(state.model.copyWith(
      eventList: [],
      countEvents: 0,
      offsetEvents: 0,
      pageEvents: 0,
      totalEvents: 0,
      limit: 10,
    )));
    try {
      final model = await _getEventsByHero(event.superheroModel);

      emit(LoadedEventsState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onGetComicsEvent(
    GetComicsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingComicsState(
      state.model.copyWith(
        showLoaderComics: true,
      ),
    ));

    try {
      final model = await _getComicsByHero(event.superheroModel);
      emit(
        LoadedComicsState(model),
      );
      emit(
        GetComicsState(model.copyWith(
          showListComics: true,
          showLoaderComics: false,
        )),
      );
    } catch (error) {
      emit(
        LoadedComicsState(state.model),
      );
      emit(ErrorState(state.model));
    }
  }

  void _onGetMoreComicsEvent(
    GetMoreComicsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingMoreComicsState(state.model));
    try {
      final model = await _getComicsByHero(event.superheroModel);
      emit(LoadedComicsState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onReloadComicsEvent(
    ReloadComicsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingComicsState(state.model.copyWith(
      comicsList: [],
      countComics: 0,
      offsetComics: 0,
      pageComics: 0,
      totalComics: 0,
      limit: 10,
    )));
    try {
      final model = await _getComicsByHero(event.superheroModel);

      emit(LoadedComicsState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onGetSeriesEvent(
    GetSeriesEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingSeriesState(
      state.model.copyWith(
        showLoaderComics: true,
      ),
    ));

    try {
      final model = await _getSeriesByHero(event.superheroModel);
      emit(
        LoadedSeriesState(model),
      );
      emit(
        GetSeriesState(model.copyWith(
          showListComics: true,
          showLoaderComics: false,
        )),
      );
    } catch (error) {
      emit(
        LoadedSeriesState(state.model),
      );
      emit(ErrorState(state.model));
    }
  }

  void _onGetMoreSeriesEvent(
    GetMoreSeriesEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingMoreSeriesState(state.model));
    try {
      final model = await _getSeriesByHero(event.superheroModel);
      emit(LoadedSeriesState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onReloadSeriesEvent(
    ReloadSeriesEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingSeriesState(state.model.copyWith(
      seriesList: [],
      countSeries: 0,
      offsetSeries: 0,
      pageSeries: 0,
      totalSeries: 0,
      limit: 10,
    )));
    try {
      final model = await _getSeriesByHero(event.superheroModel);

      emit(LoadedSeriesState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onGetStoriesEvent(
    GetStoriesEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingStoriesState(
      state.model.copyWith(
        showLoaderComics: true,
      ),
    ));

    try {
      final model = await _getStoriesByHero(event.superheroModel);
      emit(
        LoadedStoriesState(model),
      );
      emit(
        GetStoriesState(model.copyWith(
          showListComics: true,
          showLoaderComics: false,
        )),
      );
    } catch (error) {
      emit(
        LoadedStoriesState(state.model),
      );
      emit(ErrorState(state.model));
    }
  }

  void _onGetMoreStoriesEvent(
    GetMoreStoriesEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingMoreStoriesState(state.model));
    try {
      final model = await _getStoriesByHero(event.superheroModel);
      emit(LoadedStoriesState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onReloadStoriesEvent(
    ReloadStoriesEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingStoriesState(state.model.copyWith(
      storiesList: [],
      countStory: 0,
      offsetStory: 0,
      pageStories: 0,
      totalStory: 0,
      limit: 10,
    )));
    try {
      final model = await _getStoriesByHero(event.superheroModel);

      emit(LoadedStoriesState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }
}
