import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../widgets/search_form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CorrelacionBloc bloc = BlocProvider.of(context);

    return BlocProvider<CorrelacionBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Correlaciones'),
        ),
        body: SearchForm(
          onSearchByName: (String hymnName) {
            //call bloc
          },
        ),
      ),
    );
  }
}
