import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/home_page.dart';

import 'controllers/history_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final historyController = Get.put(
    HistoryController(),
  );
  await historyController.loadHistory();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Random Value Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
