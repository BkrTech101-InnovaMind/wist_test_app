import 'package:shared_preferences/shared_preferences.dart';

class StatePrefs {
  String status;

  StatePrefs(this.status);

  setTheState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(status, value);
  }

  Future<bool> getTheState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(status) ?? false;
  }
}
