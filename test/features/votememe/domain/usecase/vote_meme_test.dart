import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/features/votememe/domain/repositories/meme_repository.dart';
import 'package:memevoter/features/votememe/domain/usecases/vote_meme.dart';
import 'package:mocktail/mocktail.dart';

class MockMemeRepository extends Mock implements MemeRepository {}

void main() {
  late final VoteMeme voteMeme;
  late final MemeRepository memeRepository;
  setUpAll(() {
    memeRepository = MockMemeRepository();
    voteMeme = VoteMeme(memeRepository);
  });

  test('should vote meme successfully from repository', () async {
    //arrange
    when(() => memeRepository.voteMeme(any()))
        .thenAnswer((_) => const Result.success("vote successfuly"));
    //act
    final result = await voteMeme("123");
    //assert
    verify(() => memeRepository.voteMeme("123"));

    result.when(failure: (e) {
      throw e;
    }, success: (data) {
      expect(data, equals("vote successfuly"));
    });
    verifyNoMoreInteractions(memeRepository);
  });
  test('should got error when vote meme from repository', () async {
    //arrange
    when(() => memeRepository.voteMeme(any())).thenAnswer(
        (_) => const Result.failure(NetworkError.voteError(message: "error")));
    //act
    final result = await voteMeme("123");
    //assert
    verify(() => memeRepository.voteMeme("123"));

    result.when(failure: (e) {
      expect(e, const NetworkError.voteError(message: "error"));
    }, success: (data) {
      throw e;
    });
    verifyNoMoreInteractions(memeRepository);
  });
}
