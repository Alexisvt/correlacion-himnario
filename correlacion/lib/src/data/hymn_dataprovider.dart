import 'dart:convert';
import 'package:flutter/services.dart';

import './hymn_model.dart';

class HymnDataProvider {
  Future<List<HymnModel>> loadHymns() async {
    final String jsonString =
        await rootBundle.loadString('assets/correlations-es.json');
    final List<dynamic> parsedData = json.decode(jsonString);
    final List<HymnModel> hymns = parsedData
        .map<HymnModel>((data) => HymnModel(
            name: data['name'], oldNum: data['oldNum'], newNum: data['newNum']))
        .toList();

    return hymns;
  }

  Future<HymnModel> getHymnByOldNum(int hymnNumber) async {
    if (hymnNumber == null) {
      throw ArgumentError.notNull('hymnNumber');
    }

    if (hymnNumber <= 0) {
      throw ArgumentError.value(
        hymnNumber,
        'hymnNumber',
        'must not be less or equal to cero',
      );
    }

    final List<HymnModel> hymns = await loadHymns();
    return hymns.singleWhere((hymn) => hymn.oldNum == hymnNumber);
  }

  Future<HymnModel> getHymnByNewNum(int hymnNumber) async {
    if (hymnNumber == null) {
      throw ArgumentError.notNull('hymnNumber');
    }

    if (hymnNumber <= 0) {
      throw ArgumentError.value(
        hymnNumber,
        'hymnNumber',
        'must not be less or equal to cero',
      );
    }

    final List<HymnModel> hymns = await loadHymns();
    return hymns.singleWhere((hymn) => hymn.newNum == hymnNumber);
  }

  Future<HymnModel> getHymnByName(String hymnName) async {
    hymnName = hymnName.trim();

    if (hymnName == null) {
      throw ArgumentError.notNull('hymnName');
    }

    if (hymnName.isEmpty) {
      throw ArgumentError.value(hymnName, 'hymnName', 'must not be empty');
    }

    if (hymnName.contains(RegExp(r'\d'))) {
      throw ArgumentError.value(
          hymnName, 'hymnName', 'must not contains any digit');
    }

    final List<HymnModel> hymns = await loadHymns();
    return hymns.singleWhere(
      (hymn) => hymn.name.contains(hymnName),
      orElse: () => HymnModel(
            name: '',
            oldNum: 0,
            newNum: 0,
          ),
    );
  }
}
