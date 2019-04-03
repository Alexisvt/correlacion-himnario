import 'package:flutter/material.dart';
import '../../data/data.dart';

class ResultFormWidget extends StatelessWidget {
  final TextEditingController _hymNameController =
      TextEditingController(text: 'Nombre del himno');
  final TextEditingController _hymOldNum =
      TextEditingController(text: '# viejo');
  final TextEditingController _hymNewNum =
      TextEditingController(text: '# nuevo');
  final HymnModel model;

  ResultFormWidget({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _hymNameController.text = model.name;
    _hymNewNum.text = model.newNum.toString();
    _hymOldNum.text = model.oldNum.toString();

    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _hymNameController,
          decoration: InputDecoration(labelText: 'Nombre del himno'),
          enabled: false,
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _hymOldNum,
                decoration: InputDecoration(labelText: 'Old Num'),
                enabled: false,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: TextField(
                controller: _hymNewNum,
                decoration: InputDecoration(labelText: 'New Num'),
                enabled: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
