import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:memevoter/features/votememe/presentation/bloc/ranking_meme_cubit.dart';
import 'package:memevoter/features/votememe/presentation/bloc/ranking_meme_state.dart';

import '../../../../service_locator.dart';

class RankingMemePage extends StatelessWidget {
  const RankingMemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "Ranking Result",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => sl<RankingMemeCubit>(),
                child: BlocBuilder<RankingMemeCubit, RankingMemeState>(
                  builder: (ctx, state) {
                    if (state is RankingMemeLoaded) {
                      var listMeme = state.listMeme;
                      return ListView.separated(
                          separatorBuilder: (ctx, index) => const Divider(
                                thickness: 2,
                              ),
                          itemCount: listMeme.length,
                          itemBuilder: (ctx, index) {
                            Meme meme = listMeme[index];
                            int rank = meme.rank;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rank : $rank",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: rank == 1
                                                ? const Color(0xffffd700)
                                                : rank == 2
                                                    ? const Color(0xffC0C0C0)
                                                    : rank == 3
                                                        ? const Color(
                                                            0xffd89043)
                                                        : Colors.black,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Score : ${meme.score}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        meme.name,
                                        maxLines: 2,
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            );
                          });
                    } else if (state is RankingMemeError) {
                      Text(state.e.toString());
                    }
                    return const Center(child: Text("empty"));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
