import 'package:bloc/bloc.dart' as bloc;
import 'package:dacodes_test/app/models/serie_models/episode_model.dart';
import 'package:dacodes_test/app/models/serie_models/season_model.dart';
import 'package:dacodes_test/app/models/serie_models/serie_model.dart';
import 'package:dacodes_test/app/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc({Repository? repository})
      : repository = repository ??= Repository(),
        super(const InitialState(Model())) {
    on<GetSeriesEvent>(_onGetSeriesEvent);
    on<GetSeasonEvent>(_onGetSeasonEvent);
    on<GetEpisodeEvent>(_onGetEpisodeEvent);
  }

  late Repository repository;

  Future<Model> _getSeriesEvent({String? search}) async {
    final serieResponse = await repository.getSeriesApi(search: search);
    return state.model.copyWith(
      serie: serieResponse,
    );
  }

  void _onGetSeriesEvent(
    GetSeriesEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingSeriesState(state.model));
    try {
      final model = await _getSeriesEvent(search: event.search);
      emit(LoadedSeriesState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  Future<Model> _getSeason() async {
    final seasonResponse = await repository.getSeasonApi(search: '', season: 1);
    return state.model.copyWith(
      season: seasonResponse,
    );
  }

  void _onGetSeasonEvent(
    GetSeasonEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingSeasonState(state.model));
    try {
      final model = await _getSeason();
      emit(LoadedSeasonState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  Future<Model> _getEpisode() async {
    final episodeResponse = await repository.getEpisodeApi(
      search: '',
      season: 1,
      episode: 1,
    );
    return state.model.copyWith(
      episode: episodeResponse,
    );
  }

  void _onGetEpisodeEvent(
    GetEpisodeEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingEpisodeState(state.model));
    try {
      final model = await _getEpisode();
      emit(LoadedEpisodeState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }
}
