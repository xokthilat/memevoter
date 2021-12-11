import 'package:flutter_test/flutter_test.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/usecases/usecase.dart';
import 'package:memevoter/features/votememe/domain/repositories/meme_repository.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_round_life_time.dart';
import 'package:mocktail/mocktail.dart';

class MockMemeRepository extends Mock implements MemeRepository {}

void main() {
  late final GetRoundLifeTime getRoundLifeTime;
  late final MemeRepository memeRepository;
  setUpAll(() {
    memeRepository = MockMemeRepository();
    getRoundLifeTime = GetRoundLifeTime(memeRepository);
  });

  test('should get round lifetime from repository', () async {
    //arrange
    when(() => memeRepository.getRoundLifeTime())
        .thenAnswer((_) => const Result.success(10));
    //act
    final result = await getRoundLifeTime(NoParams());
    //assert
    verify(() => memeRepository.getRoundLifeTime());

    result.when(failure: (e) {
      throw e;
    }, success: (data) {
      expect(data, equals(10));
    });
    verifyNoMoreInteractions(memeRepository);
  });
}
