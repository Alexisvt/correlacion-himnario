import 'package:rxdart/rxdart.dart';
import '../data/data.dart' show HymnRepository, HymnModel;
import './validators.dart';

class CorrelacionBloc with ValidatorsMixin {
  final HymnRepository repository = HymnRepository();
  final BehaviorSubject<String> _hymnNameSearch = BehaviorSubject<String>();
  final BehaviorSubject<HymnModel> _hymnModel =
      new BehaviorSubject<HymnModel>(seedValue: HymnModel());

  // add data to the stream
  Stream<String> get hymnName =>
      _hymnNameSearch.stream.transform(validateHymnName);

  Stream<bool> get submitValid => hymnName.map((hymnName) => true);

  Stream<HymnModel> get hymnModel => _hymnModel.stream;

// change data
  Function(String) get changeHymnNameSearch => _hymnNameSearch.sink.add;

  Function(HymnModel) get _changehymnModelResult => _hymnModel.sink.add;

  Future<void> search() async {
    HymnModel model = await repository.getHymnByName(_hymnNameSearch.value);
    _changehymnModelResult(model);
  }

  void dispose() async {
    await _hymnNameSearch.drain();
    _hymnNameSearch.close();
    _hymnModel.close();
  }
}
