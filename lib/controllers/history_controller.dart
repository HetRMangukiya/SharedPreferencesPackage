import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class HistoryController extends GetxController {
  var randomValues = <int>[].obs;  // Observable list to store random values

  // Add new random value and update shared preferences
  Future<void> addRandomValue() async {
    int newValue = Random().nextInt(100) + 1;  // Generate random value 1-100
    randomValues.add(newValue);  // Add new value to the list

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('history', randomValues.map((e) => e.toString()).toList());
  }

  // Load values from shared preferences on startup
  Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? storedValues = prefs.getStringList('history');

    if (storedValues != null) {
      randomValues.value = storedValues.map((e) => int.parse(e)).toList();
    }
  }
}
