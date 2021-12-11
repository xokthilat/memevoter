import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:memevoter/features/votememe/presentation/bloc/ranking_meme_state.dart';

class RankingMemeCubit extends Cubit<RankingMemeState> {
  RankingMemeCubit() : super(RankingMemeLoading());
  int _memeRankSortComparison(Meme a, Meme b) {
    if (a.score < b.score) {
      return 1;
    } else if (a.score > b.score) {
      return -1;
    } else {
      return 0;
    }
  }

  void addMemeToRank({required Meme meme}) {
    var currentState = state;
    if (currentState is RankingMemeLoaded) {
      var listMeme = currentState.listMeme;
      // meme.rank = currentState.listMeme.length + 1;
      if (listMeme.contains(meme)) {
        var addedScore =
            listMeme.where((element) => element.id == meme.id).first.score + 1;
        listMeme.where((element) => element.id == meme.id).first.score =
            addedScore;
      } else {
        meme.score = 1;
        listMeme.add(meme);
      }
      listMeme.sort(_memeRankSortComparison);

      // if it has the same score then it should be the same rank
      listMeme.asMap().forEach((index, meme) {
        if (index > 0) {
          if (meme.score == listMeme[index - 1].score) {
            meme.rank = listMeme[index - 1].rank;
          } else {
            meme.rank = listMeme[index - 1].rank + 1;
          }
        }
      });
      listMeme.sort((a, b) => a.rank > b.rank ? 1 : -1);
      emit(RankingMemeLoaded(listMeme: listMeme));
    } else {
      meme.rank = 1;
      meme.score = 1;
      emit(RankingMemeLoaded(listMeme: [meme]));
    }
  }
}
