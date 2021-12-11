import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/usecases/usecase.dart';
import 'package:memevoter/features/votememe/domain/repositories/meme_repository.dart';

class VoteMeme implements UseCase<String, String> {
  final MemeRepository memeRepository;
  VoteMeme(this.memeRepository);
  @override
  Future<Result<String, NetworkError>> call(String id) async {
    return memeRepository.voteMeme(id);
  }
}
