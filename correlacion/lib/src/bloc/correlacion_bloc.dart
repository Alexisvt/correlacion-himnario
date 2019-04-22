import 'package:rxdart/rxdart.dart';
import '../data/data.dart' show HymnRepository, HymnModel;
import './validators.dart';

class CorrelacionBloc with ValidatorsMixin {
  final HymnRepository repository = HymnRepository();
  final BehaviorSubject<String> _hymnNameSearch = BehaviorSubject<String>();
  final PublishSubject<HymnModel> _hymnModel = new PublishSubject<HymnModel>();

  // add data to the stream
  Stream<String> get hymnName =>
      _hymnNameSearch.stream.transform(validateHymnName);

  Stream<bool> get submitValid => hymnName.map((hymnName) => true);

// change data
  Function(String) get changeHymnNameSearch => _hymnNameSearch.sink.add;

  void dispose() async {
    await _hymnNameSearch.drain();
    _hymnNameSearch.close();
    _hymnModel.close();
  }
}
