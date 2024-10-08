import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController historyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: historyController.randomValues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Stored Value: ${historyController.randomValues[index]}'),
          );
        },
      )),
    );
  }
}
