import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:memevoter/features/votememe/domain/entities/vote_meme_response.dart';
import 'package:memevoter/features/votememe/presentation/bloc/countdown_cubit.dart';
import 'package:memevoter/features/votememe/presentation/bloc/meme_cubit.dart';
import 'package:memevoter/features/votememe/presentation/bloc/meme_state.dart';
import '../../../../service_locator.dart';

class VoteMemePage extends StatelessWidget {
  const VoteMemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: BlocProvider(
            create: (context) => sl<MemeCubit>()..fetchMemeVoteDetail(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Meme Voter",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    BlocProvider(
                      create: (context) => sl<CountdownCubit>(),
                      child: BlocBuilder<CountdownCubit, String>(
                          builder: (ctx, state) {
                        return Text(state,
                            style: const TextStyle(fontSize: 20));
                      }),
                    )
                  ],
                ),
                Card(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text("Vote the meme",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Get the job",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                const Text("Vote your meme"),
                Expanded(
                  child: BlocBuilder<MemeCubit, MemeState>(
                    builder: (ctx, state) {
                      if (state is MemeVoteDetailLoaded) {
                        var listMeme = state.listMeme;
                        return ListView.separated(
                            separatorBuilder: (ctx, index) => const Divider(
                                  thickness: 2,
                                ),
                            itemCount: listMeme.length,
                            itemBuilder: (ctx, index) {
                              Meme meme = listMeme[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      meme.url,
                                      width: 150,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          meme.name,
                                          maxLines: 2,
                                        ),
                                        ElevatedButton(
                                            onPressed: !state.canVote
                                                ? null
                                                : () async {
                                                    var voteResult = await ctx
                                                        .read<MemeCubit>()
                                                        .voteSelectMeme(
                                                            meme.id);
                                                    voteResult.when(success:
                                                        (VoteMemeResponse
                                                            voteMemeResponse) {
                                                      Flushbar(
                                                        icon: const Icon(
                                                          Icons.check,
                                                          color: Colors.green,
                                                        ),
                                                        margin: const EdgeInsets
                                                            .all(8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        title: voteMemeResponse
                                                            .voteResponse,
                                                        message: voteMemeResponse
                                                                    .timeLeftUntilNextRound ==
                                                                ""
                                                            ? "You have voted the last round"
                                                            : "Voted for ${meme.name} You can vote again in next " +
                                                                voteMemeResponse
                                                                    .timeLeftUntilNextRound,
                                                        duration:
                                                            const Duration(
                                                                seconds: 5),
                                                      ).show(context);
                                                    }, failure: (e) {
                                                      Flushbar(
                                                        icon: const Icon(
                                                          Icons.dangerous,
                                                          color: Colors.red,
                                                        ),
                                                        margin: const EdgeInsets
                                                            .all(8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        title: "Error",
                                                        message: e.maybeWhen(
                                                            orElse: () => null,
                                                            voteError: (e) =>
                                                                e),
                                                        duration:
                                                            const Duration(
                                                                seconds: 5),
                                                      ).show(context);
                                                    });
                                                  },
                                            child: const Text("Vote"))
                                      ],
                                    )),
                                  ],
                                ),
                              );
                            });
                      } else if (state is MemeError) {
                        Text(state.e.toString());
                      }
                      return const Center(child: Text("loading"));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
