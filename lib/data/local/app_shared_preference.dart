import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  /// This method saves the jsonObject into the respective shared_preference.
  /// You will have to send the [jsonObject] using some funtion like
  /// [YourModel.toJson()].
  Future<void> saveObject(
      {required String key, required Object jsonObject}) async {
    final sp = await SharedPreferences.getInstance();
    String objectString = jsonEncode(jsonObject);
    await sp.setString(key, objectString);
  }

  /// This method retrieves the jsonObject (if present) from the
  /// respective shared_preference.
  /// You will have to map the returned object into your own model,
  /// using some function like [YourModel.fromJson(jsonObject)].
  Future<Object?> getObject({required String key}) async {
    final sp = await SharedPreferences.getInstance();
    var objectString = sp.getString(key);
    if (objectString != null) {
      return jsonDecode(objectString);
    }
    return null;
  }

  /// Attention: This will delete the shared_preference corresponding to the [key].
  Future<bool> remove({required String key}) async {
    final sp = await SharedPreferences.getInstance();
    return await sp.remove(key);
  }

  /// Attention: This will clear all of the app's shared_preferences.
  Future<bool> clear() async {
    final sp = await SharedPreferences.getInstance();
    return await sp.clear();
  }
}
