import 'package:equatable/equatable.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/usecases/usecase.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:memevoter/features/votememe/domain/repositories/meme_repository.dart';

class GetMemeVoteDetail implements UseCase<MemeVoteDetail, NoParams> {
  final MemeRepository memeRepository;
  GetMemeVoteDetail(this.memeRepository);
  @override
  Future<Result<MemeVoteDetail, NetworkError>> call(NoParams params) async {
    return await memeRepository.getMemeVoteDetail();
  }
}

class MemeVoteDetail extends Equatable {
  late final List<Meme> listMeme;
  late final int endTimeMillisec;

  @override
  // TODO: implement props
  List<Object?> get props => [listMeme, endTimeMillisec];
}
