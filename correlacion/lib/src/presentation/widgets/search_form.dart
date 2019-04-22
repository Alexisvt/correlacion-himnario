import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../data/data.dart';

import './result.dart';

typedef OnSearchByName = Function(String hymnName);

class SearchForm extends StatefulWidget {
  final OnSearchByName onSearchByName;

  SearchForm({Key key, @required this.onSearchByName})
      : assert(onSearchByName != null),
        super(key: key);

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _hymnNameController = TextEditingController();
  CorrelacionBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = CorrelacionBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          searchByhymnNameField(),
          _searchButton(),
        ],
      ),
    );
  }

  Widget searchByhymnNameField() {
    return StreamBuilder<String>(
        stream: bloc.hymnName,
        builder: (context, snapshot) {
          return TextField(
            controller: _hymnNameController,
            onChanged: bloc.changeHymnNameSearch,
            decoration: InputDecoration(
                hintText: "Buscar por nombre",
                labelText: "Nombre del himno",
                errorText: snapshot.error),
          );
        });
  }

  Widget _searchButton() {
    return StreamBuilder<bool>(
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return RaisedButton(
          child: Text('Buscar'),
          color: Colors.blue,
          onPressed: snapshot.hasData
              ? () {
                  // bloc.search();
                }
              : null,
        );
      },
    );
  }
}
