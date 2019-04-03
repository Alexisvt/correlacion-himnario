import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';
import './data/data.dart';
import './presentation/presentation.dart';

class App extends StatefulWidget {
  final HymnRepository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  CorrelacionBloc correlacionBloc;

  HymnRepository get hymnRepository => widget.repository;

  @override
  void initState() {
    correlacionBloc = CorrelacionBloc(repository: hymnRepository);
    correlacionBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    correlacionBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CorrelacionBloc>(
      bloc: correlacionBloc,
      child: MaterialApp(
        home: BlocBuilder<EventBase, StateBase>(
          bloc: correlacionBloc,
          builder: (BuildContext context, StateBase state) {
            if (state is Init) {
              return SplashScreen();
            }

            if (state is DisplayHome) {
              return HomeScreen();
            }

            if (state is Loading) {
              return LoadingPage();
            }

            if (state is Loaded) {
              return HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
