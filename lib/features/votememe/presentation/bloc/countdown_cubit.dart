import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:memevoter/core/router/app_route.dart';
import 'package:memevoter/core/service/navigation_service.dart';

class CountdownCubit extends Cubit<String> {
  late Timer timer;
  late int currentTimeLeftInMin;
  late String currentTimeLeftInSec;
  late int usedTimeInSec;
  late int endTimeInSec;
  //normally we shouldnt using service layer here but i think this case gonna be over complicated
  final NavigationService navigationService;
  CountdownCubit({required this.navigationService}) : super("");
  NumberFormat formatter = NumberFormat("00");

  void startCountDown(int endtimeMillisec) {
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;

    endTimeInSec =
        Duration(milliseconds: endtimeMillisec - currentTimestamp).inSeconds;
    var millisecInOneSecond = 1000;
    var timeleftInMillisec = endtimeMillisec - currentTimestamp;
    if (!timeleftInMillisec.isNegative) {
      var timeleftInSecond =
          (endtimeMillisec - currentTimestamp) / millisecInOneSecond;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        usedTimeInSec = timer.tick;
        int currentTimeLeftInMillisec =
            timeleftInMillisec - (timer.tick * millisecInOneSecond);
        currentTimeLeftInMin =
            Duration(milliseconds: currentTimeLeftInMillisec).inMinutes;
        currentTimeLeftInSec =
            ((timeleftInSecond - timer.tick) % 60).toStringAsFixed(0);

        //HF show wrong format like 1:60
        if (currentTimeLeftInSec == "60") {
          currentTimeLeftInSec = "00";
          currentTimeLeftInMin++;
        }

        emit(
            "$currentTimeLeftInMin:${formatter.format(int.parse(currentTimeLeftInSec))}");
      });
      Timer(Duration(milliseconds: endtimeMillisec - currentTimestamp), () {
        emit("0:00");
        timer.cancel();

        // need to wait a bit to make sure all cubit are not emiting and safe to destroy in case in slow devices
        Timer(const Duration(milliseconds: 500), () {
          navigationService.navigateAndRemoveTo(AppRoute.ranking);
        });
      });
    }
  }

  String getNextRoundTimeLeftText(int roundLifeTimeInSec) {
    //return empty string if no more round
    if (usedTimeInSec > endTimeInSec - roundLifeTimeInSec) {
      return "";
    }

    // get time left until this round end
    var secondLeft = getNextRoundTimeLeftInSecond(roundLifeTimeInSec);

    var minLeft = Duration(seconds: secondLeft).inMinutes;
    if (roundLifeTimeInSec > 60) {
      return "${minLeft == 0 ? "" : minLeft.toString() + ":"}${formatter.format(minLeft == 0 ? secondLeft : secondLeft - (60 * minLeft))} seconds";
    }
    return "${formatter.format(secondLeft - (60 * minLeft))} seconds";
  }

  int getNextRoundTimeLeftInSecond(int roundLifeTimeInSec) {
    // calcute time used since last round end
    var timeUsedSinceLastRound = usedTimeInSec -
        ((usedTimeInSec ~/ roundLifeTimeInSec) * roundLifeTimeInSec);
    // get time left until this round end
    var secondLeft = roundLifeTimeInSec - timeUsedSinceLastRound;

    return secondLeft;
  }
}
