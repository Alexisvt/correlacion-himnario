import 'package:flutter/material.dart';

import './bloc/bloc.dart' show CorrelacionBlocProvider;
import './presentation/presentation.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return CorrelacionBlocProvider(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
