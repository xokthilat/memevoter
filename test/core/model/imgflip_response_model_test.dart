import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:memevoter/core/entities/imgflip_response.dart';
import 'package:memevoter/core/model/imgflip_response_model.dart';
import 'package:memevoter/features/votememe/data/models/meme_model.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';

import '../../fixtures/fixture_reader.dart';

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
  final tImgFlipResponseModel = ImgFlipResponseModel<List<Meme>>();
  tImgFlipResponseModel
    ..data = [tMemeModel]
    ..sucess = true
    ..errorMessage = null;
  final tErrorImgFlipResponseModel = ImgFlipResponseModel<List<Meme>>();
  tErrorImgFlipResponseModel
    ..data = null
    ..sucess = false
    ..errorMessage = "error";
  test('should be a subclass of ImgFlipResponse entity', () async {
    expect(tImgFlipResponseModel, isA<ImgFlipResponse>());
  });
  test(
    'should return a valid model',
    () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('listmemes_res_with_single_meme.json'));
      final result = ImgFlipResponseModel<List<Meme>>().fromJson(
          jsonMap,
          (json) => List<Meme>.from(
              json.map((item) => MemeModel().fromJson(item)).toList()));
      expect(result, tImgFlipResponseModel);
    },
  );
  test(
    'should return a valid model when success is not true',
    () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('fail_res.json'));
      final result = ImgFlipResponseModel<List<Meme>>().fromJson(
          jsonMap,
          (json) => List<Meme>.from(
              json.map((item) => MemeModel().fromJson(item)).toList()));
      expect(result, tErrorImgFlipResponseModel);
    },
  );
}
