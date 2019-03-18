import 'dart:convert';
import 'package:equatable/equatable.dart';

class HymnModel extends Equatable {
  final String name;
  final int oldNum;
  final int newNum;

  HymnModel({this.name, this.newNum, this.oldNum})
      : super([name, oldNum, newNum]);

  // static List<HymnModel> parseJson(String response) {
  //   if (response == null) {
  //     return [];
  //   }
  //   final Map<String, dynamic> parsed = json.decode(response);
  //   return parsed.map((key, value) =>
  //       HymnModel(name: e['name'], oldNum: e['oldNum'], newNum: e['oldNum'])).toList();
  // }
}
