import 'package:flutter/foundation.dart';

void logPrint(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => logPrint(match.group(0)));
}
