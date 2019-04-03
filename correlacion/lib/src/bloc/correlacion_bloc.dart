import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './correlacion_event.dart';
import './correlacion_state.dart';
import '../data/data.dart';

class CorrelacionBloc extends Bloc<EventBase, StateBase> {
  final HymnRepository repository;

  CorrelacionBloc({@required this.repository}) : assert(repository != null);

  @override
  StateBase get initialState => Init();

  @override
  Stream<StateBase> mapEventToState(
    StateBase currentState,
    EventBase event,
  ) async* {
    if (event is AppStarted) {
      await Future.delayed(Duration(seconds: 3));
      yield DisplayHome();
    }

    if (event is SearchHymnByName) {
      yield Loading();

      try {
        final HymnModel hymn = await repository.getHymnByName(event.hymnName);

        yield Loaded(hymn: hymn);
      } catch (_) {
        yield Error(message: "something happened");
      }
    }

    if (event is SearchHymnByNewNum) {
      yield Loading();

      try {
        final HymnModel hymn =
            await repository.getNewHymnByNumber(event.hymnNumber);

        yield Loaded(hymn: hymn);
      } catch (_) {
        yield Error(message: "something happened");
      }
    }

    if (event is SearchHymnByOldNum) {
      yield Loading();

      try {
        final HymnModel hymn =
            await repository.getOldHymnByNumber(event.hymnNumber);

        yield Loaded(hymn: hymn);
      } catch (_) {
        yield Error(message: "something happened");
      }
    }
  }
}
