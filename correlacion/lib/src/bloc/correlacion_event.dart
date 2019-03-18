import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../data/hymn_model.dart';

abstract class EventBase extends Equatable {
  EventBase([List props = const []]) : super(props);
}

class Init extends EventBase {}

class Loading extends EventBase {}

class SearchHymnByName extends EventBase {
  final String hymnName;
  SearchHymnByName({@required this.hymnName})
      : assert(hymnName != null),
        super([hymnName]);
}

class SearchHymnByNewNum extends EventBase {
  final int hymnNumber;

  SearchHymnByNewNum({@required this.hymnNumber})
      : assert(hymnNumber != null),
        super([hymnNumber]);
}

class SearchHymnByOldNum extends EventBase {
  final int hymnNumber;

  SearchHymnByOldNum({@required this.hymnNumber})
      : assert(hymnNumber != null),
        super([hymnNumber]);
}

class Loaded extends EventBase {
  final HymnModel hymn;

  Loaded({@required this.hymn})
      : assert(hymn != null),
        super([hymn]);
}

class Error extends EventBase {
  final String message;

  Error({@required this.message})
      : assert(message != null),
        super([message]);
}
