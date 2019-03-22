import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

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
        return Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[hymnNameField()],
          ),
        );
      },
    );
  }

  Widget hymnNameField() {
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
    );
  }
}
