import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_meme_vote_detail.dart';

abstract class MemeRepository {
  Future<Result<MemeVoteDetail, NetworkError>> getMemeVoteDetail();
  Result<String, NetworkError> voteMeme(String id);
  Result<int, NetworkError> getRoundLifeTime();
}
