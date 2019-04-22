import 'package:flutter/material.dart';
import './correlacion_bloc.dart' show CorrelacionBloc;

class CorrelacionBlocProvider extends InheritedWidget {
  final CorrelacionBloc bloc = CorrelacionBloc();

  CorrelacionBlocProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CorrelacionBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CorrelacionBlocProvider)
            as CorrelacionBlocProvider)
        .bloc;
  }
}
