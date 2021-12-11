import 'package:equatable/equatable.dart';

import 'package:memevoter/features/votememe/domain/entities/meme.dart';

abstract class MemeState extends Equatable {}

class MemeVoteDetailLoaded extends MemeState {
  final List<Meme> listMeme;
  final bool canVote;
  MemeVoteDetailLoaded({
    required this.listMeme,
    required this.canVote,
  });

  @override
  List<Object?> get props => [canVote];
}

class MemeLoading extends MemeState {
  @override
  List<Object?> get props => [];
}

class MemeError extends MemeState {
  final Exception e;
  MemeError({required this.e});

  @override
  List<Object?> get props => [e];
}
