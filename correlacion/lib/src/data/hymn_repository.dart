import 'package:meta/meta.dart';

import './hymn_model.dart';
import './hymn_dataprovider.dart';

class HymnRepository {
  final HymnDataProvider dataProvider;

  HymnRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<HymnModel> getOldHymnByNumber(int hymnNumber) async {
    HymnModel hymn;

    try {
      hymn = await dataProvider.getHymnByOldNum(hymnNumber);
    } catch (e) {
      print(e);
      rethrow;
    }

    return hymn;
  }

  Future<HymnModel> getNewHymnByNumber(int hymnNumber) async {
    HymnModel hymn;

    try {
      hymn = await dataProvider.getHymnByNewNum(hymnNumber);
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
    return hymn;
  }
}
