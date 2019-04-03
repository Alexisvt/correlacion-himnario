import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../data/data.dart';

import './result.dart';

typedef OnSearchByName = Function(String hymnName);

class SearchForm extends StatelessWidget {
  final TextEditingController _hymnNameController = TextEditingController();
  final OnSearchByName onSearchByName;

  SearchForm({Key key, @required this.onSearchByName})
      : assert(onSearchByName != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final CorrelacionBloc bloc = BlocProvider.of(context);
    return BlocBuilder<EventBase, StateBase>(
      bloc: bloc,
      builder: (BuildContext context, StateBase state) {
        HymnModel hymn = HymnModel(
          name: 'Nombre del himno',
          oldNum: 0,
          newNum: 0,
        );

        if (state is Loaded) {
          hymn = state.hymn;
        }
        return Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              hymnNameField(bloc),
              ResultFormWidget(model: hymn),
            ],
          ),
        );
      },
    );
  }

  Widget hymnNameField(CorrelacionBloc bloc, {HymnModel hymn}) {
    return TextFormField(
      controller: _hymnNameController,
      decoration: InputDecoration(
        hintText: "Buscar por nombre",
        labelText: "Nombre del himno",
      ),
      autovalidate: true,
      validator: (String value) {
        if (value.isEmpty) {
          return "El espacio del nombre del himno no puede ser vacio";
        }
      },
      onSaved: (String value) {
        print(value);
      },
      onFieldSubmitted: (String value) {
        bloc.dispatch(
          SearchHymnByName(hymnName: value),
        );
      },
    );
  }
}
