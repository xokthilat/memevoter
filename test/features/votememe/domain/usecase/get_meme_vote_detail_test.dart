import 'package:flutter_test/flutter_test.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/usecases/usecase.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:memevoter/features/votememe/domain/repositories/meme_repository.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_meme_vote_detail.dart';
import 'package:mocktail/mocktail.dart';

class MockMemeRepository extends Mock implements MemeRepository {}

void main() {
  late final GetMemeVoteDetail getMemeVoteDetail;
  late final MemeRepository memeRepository;
  setUpAll(() {
    memeRepository = MockMemeRepository();
    getMemeVoteDetail = GetMemeVoteDetail(memeRepository);
  });
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
  var fakeMemeVoteDetail = MemeVoteDetail()
    ..listMeme = fakeListMeme
    ..endTimeMillisec = 0;

  test('should get meme vote detail from repository', () async {
    //arrange
    when(() => memeRepository.getMemeVoteDetail())
        .thenAnswer((_) async => Result.success(fakeMemeVoteDetail));
    //act
    final result = await getMemeVoteDetail(NoParams());
    //assert
    verify(() => memeRepository.getMemeVoteDetail());

    result.when(failure: (e) {
      throw e;
    }, success: (data) {
      expect(data, equals(fakeMemeVoteDetail));
    });
    verifyNoMoreInteractions(memeRepository);
  });
  test('should error when try to get meme vote detail from repository', () async {
    //arrange
    when(() => memeRepository.getMemeVoteDetail()).thenAnswer(
        (_) async => const Result.failure(NetworkError.type(error: "error")));
    //act
    final result = await getMemeVoteDetail(NoParams());
    //assert
    verify(() => memeRepository.getMemeVoteDetail());

    result.when(failure: (error) {
      expect(error, equals(const NetworkError.type(error: "error")));
    }, success: (data) {
      throw data;
    });
    verifyNoMoreInteractions(memeRepository);
  });
}
