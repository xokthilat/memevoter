import 'dart:async';

import '../../constants.dart';

class VoteHandler {
  late String _currentVoteToken;
  late int endTimeMillisec;
  late Timer timer;
  int secInmillisec = 1000;
  List<String> usedToken = [];
  List<String> memeVoted = [];
  VoteHandler() {
    _currentVoteToken =
        "token_" + DateTime.now().millisecondsSinceEpoch.toString();
    timer = Timer.periodic(const Duration(seconds: tokenLifeTimeSec), (timer) {
      _currentVoteToken =
          "token_" + DateTime.now().millisecondsSinceEpoch.toString();
      // print(_currentVoteToken);
    });
    endTimeMillisec = DateTime.now().millisecondsSinceEpoch +
        (campaignLifeTimeSec * secInmillisec);
    Timer(const Duration(seconds: campaignLifeTimeSec), () {
      timer.cancel();
    });
  }
  String getVoteToken(String userToken) {
    if (userToken == "user1") {
      if (!timer.isActive) {
        throw TimeoutException("campaign already end");
      }
      return _currentVoteToken;
    }
    throw Exception("401 unauthorized");
  }

  int get roundLifeTime => tokenLifeTimeSec;

  String voteMeme({required String token, required String memeId}) {
    int tokenTimeStamp = int.parse(token.split('_')[1]);
    int currentTimeStamp = DateTime.now().millisecondsSinceEpoch;
    int tokenLifeTimeInMillisec = tokenLifeTimeSec * secInmillisec;
    if (usedToken.contains(token)) {
      throw Exception("token already used");
    }
    if (!timer.isActive) {
      throw TimeoutException("campaign already end");
    }
    if (currentTimeStamp - tokenTimeStamp > tokenLifeTimeInMillisec) {
      throw Exception("token expired");
    }
    usedToken.add(token);
    memeVoted.add(memeId);
    return "vote successfuly";
  }
}
