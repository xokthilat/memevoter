import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/usecases/usecase.dart';
import 'package:memevoter/features/votememe/domain/entities/vote_meme_response.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_meme_vote_detail.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_round_life_time.dart';
import 'package:memevoter/features/votememe/domain/usecases/vote_meme.dart';
import 'package:memevoter/features/votememe/presentation/bloc/countdown_cubit.dart';
import 'package:memevoter/features/votememe/presentation/bloc/meme_state.dart';
import 'package:memevoter/features/votememe/presentation/bloc/ranking_meme_cubit.dart';

class MemeCubit extends Cubit<MemeState> {
  final GetMemeVoteDetail getMemeList;
  final CountdownCubit countdownCubit;
  final VoteMeme voteMeme;
  final RankingMemeCubit rankingMemeCubit;
  final GetRoundLifeTime getRoundLifeTime;
  MemeCubit(
      {required this.getMemeList,
      required this.countdownCubit,
      required this.rankingMemeCubit,
      required this.getRoundLifeTime,
      required this.voteMeme})
      : super(MemeLoading());

  void fetchMemeVoteDetail() async {
    Result<MemeVoteDetail, NetworkError> listMemeStatus =
        await getMemeList.call(NoParams());
    listMemeStatus.when(success: (MemeVoteDetail memeVoteDetail) {
      countdownCubit.startCountDown(memeVoteDetail.endTimeMillisec);
      emit(MemeVoteDetailLoaded(
          listMeme: memeVoteDetail.listMeme, canVote: true));
    }, failure: (NetworkError error) {
      emit(MemeError(e: error));
    });
  }

  Future<Result<VoteMemeResponse, NetworkError>> voteSelectMeme(
      String id) async {
    VoteMemeResponse voteMemeResponse = VoteMemeResponse();
    Result<String, NetworkError> voteMemeResult = await voteMeme.call(id);
    try {
      voteMemeResult.when(success: (String response) {
        voteMemeResponse.voteResponse = response;
      }, failure: (e) {
        throw e;
      });
    } on NetworkError catch (e) {
      return Result.failure(e);
    }

    // get time left to notify user when is the next time they can vote
    Result<int, NetworkError> roundLifeTimeResult =
        await getRoundLifeTime.call(NoParams());
    roundLifeTimeResult.when(success: (int roundLifeTime) {
      voteMemeResponse.timeLeftUntilNextRound =
          countdownCubit.getNextRoundTimeLeftText(roundLifeTime);
      var currentState = state;
      if (currentState is MemeVoteDetailLoaded) {
        //
        MemeVoteDetailLoaded memeVoteDetailLoaded = MemeVoteDetailLoaded(
            canVote: false, listMeme: currentState.listMeme);
        emit(memeVoteDetailLoaded);

        //when get time left sucess then add the selected meme to local state;
        rankingMemeCubit.addMemeToRank(
            meme: currentState.listMeme.where((meme) => meme.id == id).first);

        //start timer to refresh button ui when they can vote
        if (voteMemeResponse.timeLeftUntilNextRound != "") {
          Timer(
              Duration(
                  seconds: countdownCubit
                      .getNextRoundTimeLeftInSecond(roundLifeTime)), () {
            MemeVoteDetailLoaded memeVoteDetailLoaded = MemeVoteDetailLoaded(
                canVote: true, listMeme: currentState.listMeme);
            emit(memeVoteDetailLoaded);
          });
        }
      }
    }, failure: (e) {
      return Result.failure(e);
    });
    return Result.success(voteMemeResponse);
  }
}
