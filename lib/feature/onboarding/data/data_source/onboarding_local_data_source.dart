import 'dart:io';

import 'package:futebol_tv/commons/exception/exception.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class IOnboardingLocalDataSource {
  Future<bool> isFirstTime();
  Future<void> insertFirstTime(bool isFirstTime);
}

@Injectable(as: IOnboardingLocalDataSource)
class OnboardingLocalDataSource implements IOnboardingLocalDataSource {

  final SharedPreferences _prefs;
  static const isFirstTimeAccess = "is_first_time_access";

  OnboardingLocalDataSource(this._prefs);

  @override
  Future<bool> isFirstTime() async {
    sleep(const Duration(seconds: 2));
    return _prefs.getBool(isFirstTimeAccess) ?? true;
  }

  @override
  Future<void> insertFirstTime(bool isFirstTime) async {
    try {

      await _prefs.setBool(isFirstTimeAccess, isFirstTime);

    } catch (e, _) {
      String cause = "There is an exception on local database datasource layer. Class OnboardingLocalDataSource method insert ${e.toString()}";
      throw DataLocalException(cause);
    }
  }
}
