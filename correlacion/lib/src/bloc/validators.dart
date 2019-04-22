import 'dart:async';

mixin ValidatorsMixin {
  final StreamTransformer<String, String> validateHymnName =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (hymnName, sink) {
    if (hymnName != null && hymnName.isNotEmpty) {
      sink.add(hymnName);
    } else {
      sink.addError('El himno ingresado es invalido');
    }
  });
}
