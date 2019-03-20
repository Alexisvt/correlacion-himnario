import 'package:flutter/material.dart';

import './src/data/data.dart';
import './src/app.dart';

main(List<String> args) {
  runApp(App(
    repository: HymnRepository(
      dataProvider: HymnDataProvider(),
    ),
  ));
}
