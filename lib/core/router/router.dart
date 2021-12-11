import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memevoter/core/router/app_route.dart';
import 'package:memevoter/features/votememe/presentation/pages/ranking_meme_page.dart';
import 'package:memevoter/features/votememe/presentation/pages/vote_meme_page.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.home:
      return _getRoute(settings.name!, const VoteMemePage());
    case AppRoute.ranking:
      return _getRoute(settings.name!, const RankingMemePage());
    default:
      return _getRoute(settings.name!, const VoteMemePage());
  }
}

_getRoute(String routeName, Widget page) {
  return MaterialPageRoute(
    builder: (BuildContext context) => page,
    settings: RouteSettings(name: routeName),
  );
}
