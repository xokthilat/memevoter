import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:memevoter/core/service/api_holder.dart';
import 'package:memevoter/core/service/network_connectivity.dart';
import 'package:memevoter/core/service/network_creator.dart';
import 'package:memevoter/core/single_source_of_truth/network_decoder.dart';
import 'package:memevoter/core/single_source_of_truth/network_executer.dart';
import 'package:memevoter/features/votememe/data/models/meme_model.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';

class MockNetworkConnectivity extends Mock implements NetworkConnectivity {}

void main() {
  late final NetworkConnectivity networkConnectivity;
  late final NetworkCreator networkCreator;
  late final NetworkDecoder networkDecoder;
  late final NetworkExecuter networkExecuter;
  late final Dio cilent;
  setUpAll(() {
    networkConnectivity = MockNetworkConnectivity();
    cilent = Dio(BaseOptions());
    networkCreator = NetworkCreator(client: cilent);
    networkDecoder = NetworkDecoder();
    networkExecuter = NetworkExecuter(
        networkDecoder: networkDecoder,
        networkCreator: networkCreator,
        networkConnectivity: networkConnectivity);
  });
  group("Network executer", () {
    test('should return serialized list of memes success when execute api call',
        () async {
      final dioAdapter = DioAdapter(dio: cilent);
      dioAdapter.onGet(
        const ApiHolder.fetchListMeme().path,
        (server) =>
            server.reply(200, json.decode(fixture('listmemes_res.json'))),
      );
      when(() => networkConnectivity.status).thenAnswer((_) async {
        return true;
      });
      final Map<String, dynamic> listJson =
          json.decode(fixture('listmemes_res.json'));
      final expectedResult = listJson["data"]["memes"]
          .map((i) => MemeModel().fromJson(i))
          .toList();
      var result = await networkExecuter.execute<MemeModel, List<Meme>>(
          route: const ApiHolder.fetchListMeme(), responseType: MemeModel());
      result.when(failure: (e) {
        throw e;
      }, success: (data) {
        expect(data, expectedResult);
      });
    });
    test('should return network error when execute api call', () async {
      final dioAdapter = DioAdapter(dio: cilent);
      dioAdapter.onGet(
        const ApiHolder.fetchListMeme().path,
        (server) => server.reply(400, json.decode(fixture('listmemes_res.json'))),
      );
      when(() => networkConnectivity.status).thenAnswer((_) async {
        return true;
      });
      var result = await networkExecuter.execute<MemeModel, List<Meme>>(
          route: const ApiHolder.fetchListMeme(), responseType: MemeModel());
      result.when(failure: (error) {
        error.when(request: (dioError) {
          expect(dioError, isA<DioError>());
        }, type: (typeError) {
          throw typeError!;
        }, connectivity: (connectionError) {
          throw connectionError!;
        }, imgflipInternal: (String? message) {
          throw message!;
        }, voteError: (String? message) {
          throw message!;
        });
      }, success: (data) {
        throw data;
      });
    });
    test('should return type error when execute api call', () async {
      final dioAdapter = DioAdapter(dio: cilent);
      dioAdapter.onGet(
        const ApiHolder.fetchListMeme().path,
        (server) => server.reply(200, json.decode(fixture('meme.json'))),
      );
      when(() => networkConnectivity.status).thenAnswer((_) async {
        return true;
      });
      var result = await networkExecuter.execute<MemeModel, List<Meme>>(
          route: const ApiHolder.fetchListMeme(), responseType: MemeModel());
      result.when(failure: (error) {
        error.when(request: (dioError) {
          throw dioError;
        }, type: (typeError) {
          expect(typeError, startsWith("type"));
        }, connectivity: (connectionError) {
          throw connectionError!;
        }, imgflipInternal: (String? message) {
          throw message!;
        }, voteError: (String? message) {
          throw message!;
        });
      }, success: (data) {
        throw data;
      });
    });
    test('should return no internet connection when execute api call',
        () async {
      final dioAdapter = DioAdapter(dio: cilent);
      dioAdapter.onGet(
        const ApiHolder.fetchListMeme().path,
        (server) => server.reply(200, json.decode(fixture('listmemes_res.json'))),
      );
      when(() => networkConnectivity.status).thenAnswer((_) async {
        return false;
      });
      var result = await networkExecuter.execute<MemeModel, List<Meme>>(
          route: const ApiHolder.fetchListMeme(), responseType: MemeModel());
      result.when(failure: (error) {
        error.when(request: (dioError) {
          throw dioError;
        }, type: (typeError) {
          throw typeError!;
        }, connectivity: (connectionError) {
          expect(connectionError, "No Internet Connection");
        }, imgflipInternal: (String? message) {
          throw message!;
        }, voteError: (String? message) {
          throw message!;
        });
      }, success: (data) {
        throw data;
      });
    });
  });
}
