import 'package:memevoter/core/backend/vote_handler.dart';
import 'package:memevoter/core/service/api_holder.dart';
import 'package:memevoter/core/single_source_of_truth/network_executer.dart';
import 'package:memevoter/features/votememe/data/models/meme_model.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:memevoter/features/votememe/domain/repositories/meme_repository.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_meme_vote_detail.dart';

import '../../../../constants.dart';

class MemeRepositoryImpl implements MemeRepository {
  final NetworkExecuter networkExecuter;
  final VoteHandler voteHandler;
  MemeRepositoryImpl(
      {required this.networkExecuter, required this.voteHandler});
  String voteToken = "";
  @override
  Future<Result<MemeVoteDetail, NetworkError>> getMemeVoteDetail() async {
    MemeVoteDetail memeVoteDetail = MemeVoteDetail();
    var resultMemeList = await networkExecuter.execute<MemeModel, List<Meme>>(
        route: const ApiHolder.fetchListMeme(), responseType: MemeModel());
    return resultMemeList.when(
        success: (List<Meme> listMeme) {
          memeVoteDetail.endTimeMillisec = voteHandler.endTimeMillisec;
          memeVoteDetail.listMeme = listMeme;
          voteToken = voteHandler.getVoteToken(userToken);
          return Result.success(memeVoteDetail);
        },
        failure: (e) => Result.failure(e));
  }

  @override
  Result<String, NetworkError> voteMeme(String id) {
    try {
      var requestStatus = voteHandler.voteMeme(
          token:
              voteToken == "" ? voteHandler.getVoteToken(userToken) : voteToken,
          memeId: id);
      voteToken = "";
      return Result.success(requestStatus);
    } on Exception catch (e) {
      // trying to simulate the api request interceptor when token is expired
      if (e.toString() == "Exception: token expired") {
        try {
          var requestStatus = voteHandler.voteMeme(
              token: voteHandler.getVoteToken(userToken), memeId: id);
          voteToken = "";
          return Result.success(requestStatus);
        } catch (e) {
          voteToken = "";
          return Result.failure(NetworkError.voteError(message: e.toString()));
        }
      }
      voteToken = "";
      return Result.failure(NetworkError.voteError(message: e.toString()));
    }
  }

  @override
  Result<int, NetworkError> getRoundLifeTime() {
    var roundLifeTimeInSec = voteHandler.roundLifeTime;
    return Result.success(roundLifeTimeInSec);
  }
}
