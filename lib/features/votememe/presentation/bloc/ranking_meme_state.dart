import 'package:memevoter/features/votememe/domain/entities/meme.dart';

abstract class RankingMemeState {}

class RankingMemeLoaded extends RankingMemeState {
  final List<Meme> listMeme;
  RankingMemeLoaded({required this.listMeme});
}

class RankingMemeLoading extends RankingMemeState {}

class RankingMemeError extends RankingMemeState {
  final Exception e;
  RankingMemeError({required this.e});
}
