import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../data/hymn_model.dart';

class StateBase extends Equatable {
  StateBase([List props = const []]) : super(props);
}

class Loading extends StateBase {}

class Loaded extends StateBase {
  final HymnModel hymn;

  Loaded({@required this.hymn})
      : assert(hymn != null),
        super([hymn]);
}

class Error extends StateBase {
  final String message;

  Error({@required this.message})
      : assert(message != null),
        super([message]);
}
