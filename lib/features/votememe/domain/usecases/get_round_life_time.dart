import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/usecases/usecase.dart';
import 'package:memevoter/features/votememe/domain/repositories/meme_repository.dart';

class GetRoundLifeTime implements UseCase<int, NoParams> {
  final MemeRepository memeRepository;
  GetRoundLifeTime(this.memeRepository);
  @override
  Future<Result<int, NetworkError>> call(NoParams noParams) async {
    return memeRepository.getRoundLifeTime();
  }
}
