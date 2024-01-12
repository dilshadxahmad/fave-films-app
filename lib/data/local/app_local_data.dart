import 'package:shared_preferences/shared_preferences.dart';

class AppLocalData {
  Future<bool> isFavorite({required String id}) async {
    final favPref = await SharedPreferences.getInstance();
    return favPref.getBool(id) ?? false;
  }

  Future<void> markFavorite({required String id, required bool value}) async {
    final favPref = await SharedPreferences.getInstance();
    favPref.setBool(id, value);
  }

  Future<void> addToFavorites({required String id, required bool value}) async {
    final favPref = await SharedPreferences.getInstance();
    favPref.setBool(id, value);
  }
}
