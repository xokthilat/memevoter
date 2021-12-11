import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:memevoter/constants.dart';
import 'package:memevoter/core/backend/vote_handler.dart';
import 'package:memevoter/core/interface/api_client/base_client_generator.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/single_source_of_truth/network_executer.dart';
import 'package:memevoter/features/votememe/data/models/meme_model.dart';
import 'package:memevoter/features/votememe/data/repositories/meme_repository_impl.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_meme_vote_detail.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkExecuter extends Mock implements NetworkExecuter {}

class MockVoteHandler extends Mock implements VoteHandler {}

class MockBaseClientGenerator extends Mock implements BaseClientGenerator {}

class MockMemeModel extends Mock implements MemeModel {}

void main() {
  late final NetworkExecuter networkExecuter;
  late final VoteHandler voteHandler;
  late final MemeRepositoryImpl memeRepositoryImpl;
  setUpAll(() {
    voteHandler = MockVoteHandler();
    networkExecuter = MockNetworkExecuter();
    memeRepositoryImpl = MemeRepositoryImpl(
        networkExecuter: networkExecuter, voteHandler: voteHandler);
    registerFallbackValue(MockBaseClientGenerator());
    registerFallbackValue(MockMemeModel());
  });
  group("Meme Repository", () {
    var fakeListMeme = [
      Meme()
        ..id = "181913649"
        ..height = 1200
        ..width = 1200
        ..boxCount = 2
        ..url = "https://i.imgflip.com/30b1gx.jpg"
        ..name = "Drake Hotline Bling"
        ..rank = 1
        ..score = 1,
    ];
    group("getMemeVoteDetail", () {
      test(
          'Should return success list of meme data and campaing time when call getMemeVoteDetail',
          () async {
        when(() => networkExecuter.execute<MemeModel, List<Meme>>(
                route: any(named: "route"),
                responseType: any(named: "responseType")))
            .thenAnswer((_) async => Result.success(fakeListMeme));
        when(() => voteHandler.endTimeMillisec).thenReturn(0);
        when(() => voteHandler.getVoteToken(userToken)).thenReturn("token");
        var result = await memeRepositoryImpl.getMemeVoteDetail();

        result.when(success: (data) {
          expect(
              data,
              MemeVoteDetail()
                ..listMeme = fakeListMeme
                ..endTimeMillisec = 0);
        }, failure: (e) {
          throw e;
        });
      });
      test('Should return failure when call getMemeVoteDetail', () async {
        when(() => networkExecuter.execute<MemeModel, List<Meme>>(
                route: any(named: "route"),
                responseType: any(named: "responseType")))
            .thenAnswer((_) async =>
                const Result.failure(NetworkError.type(error: "error")));
        when(() => voteHandler.endTimeMillisec).thenReturn(0);
        when(() => voteHandler.getVoteToken(userToken)).thenReturn("token");
        var result = await memeRepositoryImpl.getMemeVoteDetail();
        result.when(success: (data) {
          throw data;
        }, failure: (error) {
          error.maybeWhen(orElse: () {
            throw "error";
          }, type: (typeError) {
            expect(typeError, "error");
          });
        });
      });
    });
    group("voteMeme", () {
      TimeoutException timeoutError = TimeoutException("campaign already end");
      Exception errorUsedToken = Exception("token already used");
      Exception errorTokenTimeout = Exception("token expired");
      test('Should return success when vote meme', () async {
        when(() => voteHandler.voteMeme(
            memeId: any(named: "memeId"),
            token: any(named: "token"))).thenReturn("vote successfuly");
        when(() => voteHandler.getVoteToken(userToken)).thenReturn("token");
        var result = memeRepositoryImpl.voteMeme("");

        result.when(success: (data) {
          expect(data, "vote successfuly");
        }, failure: (e) {
          throw e;
        });
      });
      test('Should return failure when vote meme but campaign already end',
          () async {
        when(() => voteHandler.voteMeme(
            memeId: any(named: "memeId"),
            token: any(named: "token"))).thenThrow(timeoutError);
        when(() => voteHandler.getVoteToken(userToken)).thenReturn("token");
        var result = memeRepositoryImpl.voteMeme("");

        result.when(success: (data) {
          throw data;
        }, failure: (e) {
          expect(e, NetworkError.voteError(message: timeoutError.toString()));
        });
      });
      test('Should return failure when vote meme with used token', () async {
        when(() => voteHandler.voteMeme(
            memeId: any(named: "memeId"),
            token: any(named: "token"))).thenThrow(errorUsedToken);
        when(() => voteHandler.getVoteToken(userToken)).thenReturn("token");
        var result = memeRepositoryImpl.voteMeme("");

        result.when(success: (data) {
          throw data;
        }, failure: (e) {
          expect(
              e, NetworkError.voteError(message: errorUsedToken.toString()));
        });
      });
      test(
          'Should return sucess when vote meme with used token but be able to renew token',
          () async {
        memeRepositoryImpl.voteToken = "test";
        when(() =>
                voteHandler.voteMeme(memeId: any(named: "memeId"), token: "test"))
            .thenThrow(errorTokenTimeout);
        when(() => voteHandler.voteMeme(
            memeId: any(named: "memeId"),
            token: "token")).thenReturn("vote successfuly");
        when(() => voteHandler.getVoteToken(userToken)).thenReturn("token");
        var result = memeRepositoryImpl.voteMeme("");

        result.when(success: (data) {
          expect(memeRepositoryImpl.voteToken, "");
          expect(data, "vote successfuly");
        }, failure: (e) {
          throw e;
        });
      });
    });

    group("getRoundLifeTime", () {
      test('Should return success when get getRoundLifeTime', () async {
        when(() => voteHandler.roundLifeTime).thenReturn(10);
        var result = memeRepositoryImpl.getRoundLifeTime();

        result.when(success: (data) {
          expect(data, 10);
        }, failure: (e) {
          throw e;
        });
      });
    });
  });
}
