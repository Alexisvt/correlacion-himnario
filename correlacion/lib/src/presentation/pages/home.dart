import 'package:flutter/material.dart';

import '../widgets/search_form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Correlaciones'),
      ),
      body: SearchForm(
        onSearchByName: (String hymnName) {
          //call bloc
        },
      ),
    );
  }
}
