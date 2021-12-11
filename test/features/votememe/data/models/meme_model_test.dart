import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:memevoter/features/votememe/data/models/meme_model.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tMemeModel = MemeModel();
  tMemeModel
    ..id = "181913649"
    ..height = 1200
    ..width = 1200
    ..boxCount = 2
    ..url = "https://i.imgflip.com/30b1gx.jpg"
    ..name = "Drake Hotline Bling"
    ..rank = 1
    ..score = 1;

  test('should be a subclass of Meme entity', () async {
    expect(tMemeModel, isA<Meme>());
  });
  test(
    'should return a valid model',
    () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('meme.json'));
      final result = MemeModel().fromJson(jsonMap);
      expect(result, tMemeModel);
    },
  );
}
