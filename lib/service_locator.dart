import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:memevoter/core/backend/vote_handler.dart';
import 'package:memevoter/core/service/navigation_service.dart';
import 'package:memevoter/core/service/network_connectivity.dart';
import 'package:memevoter/core/service/network_creator.dart';
import 'package:memevoter/core/single_source_of_truth/network_decoder.dart';
import 'package:memevoter/core/single_source_of_truth/network_executer.dart';
import 'package:memevoter/features/votememe/data/repositories/meme_repository_impl.dart';
import 'package:memevoter/features/votememe/domain/repositories/meme_repository.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_meme_vote_detail.dart';
import 'package:memevoter/features/votememe/domain/usecases/get_round_life_time.dart';
import 'package:memevoter/features/votememe/domain/usecases/vote_meme.dart';
import 'package:memevoter/features/votememe/presentation/bloc/meme_cubit.dart';
import 'package:memevoter/features/votememe/presentation/bloc/ranking_meme_cubit.dart';
import 'features/votememe/presentation/bloc/countdown_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MemeCubit(
      rankingMemeCubit: sl(),
      getMemeList: sl(),
      countdownCubit: sl(),
      voteMeme: sl(),
      getRoundLifeTime: sl()));
  sl.registerLazySingleton(() => RankingMemeCubit());
  sl.registerLazySingleton(() => CountdownCubit(navigationService: sl()));

  sl.registerLazySingleton(() => GetMemeVoteDetail(sl()));

  sl.registerLazySingleton(() => GetRoundLifeTime(sl()));
  sl.registerLazySingleton(() => VoteMeme(sl()));
  sl.registerLazySingleton<MemeRepository>(() => MemeRepositoryImpl(
        networkExecuter: sl(),
        voteHandler: sl(),
      ));

  sl.registerLazySingleton(() => NetworkExecuter(
      networkConnectivity: sl(),
      networkCreator: sl(),
      networkDecoder: sl()));

  sl.registerLazySingleton(() => NetworkCreator(client: sl()));
  sl.registerLazySingleton(() => NetworkDecoder());
  sl.registerLazySingleton(() => NetworkConnectivity(connectivity: sl()));
  sl.registerLazySingleton(() => Dio());
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  // sl.registerLazySingleton(() => prefs);

  // sl.registerLazySingleton(
  //     () => SharedPreferencesDatasource(sharedPreferences: sl()));
  sl.registerLazySingleton(() => VoteHandler());
  sl.registerLazySingleton(() => NavigationService());
  sl.registerLazySingleton(() => Connectivity());
}
