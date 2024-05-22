import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/constant.dart';

class BackUpContactsScreenProvider extends ChangeNotifier {
  BackUpContactsScreenProvider() {
    getbackup();
  }

  BackUpDurations duration = BackUpDurations.none;

  placevalue(value) {
    duration = value;
    backupschudle = duration == BackUpDurations.onedayonce
        ? "1 Days Once"
        : duration == BackUpDurations.sevendayonce
            ? "7 Days Once"
            : duration == BackUpDurations.fifteendayonce
                ? "15 Days Once"
                : duration == BackUpDurations.thirydayonce
                    ? "30 Days Once"
                    : "";
    notifyListeners();
  }

  placevaluefromapi() {
    if (backupschudle == "1 Days Once") {
      placevalue(BackUpDurations.onedayonce);
    }
    if (backupschudle == "7 Days Once") {
      placevalue(BackUpDurations.sevendayonce);
    }
    if (backupschudle == "15 Days Once") {
      placevalue(BackUpDurations.fifteendayonce);
    }
    if (backupschudle == "30 Days Once") {
      placevalue(BackUpDurations.thirydayonce);
    }
  }

  setbackup(val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('backup', val);
  }

  getbackup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? backup = prefs.getString('backup');
    backup == null ? "" : backupschudle = backup;
    placevaluefromapi();
  }
}
