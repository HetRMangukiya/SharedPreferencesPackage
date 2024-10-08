import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/history_controller.dart';
import 'history_page.dart';

class HomePage extends StatelessWidget {
  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Get.to(() => HistoryPage());
            },
          ),
        ],
      ),
      body: Obx(() => ListView.builder(
        itemCount: historyController.randomValues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Value: ${historyController.randomValues[index]}'),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await historyController.addRandomValue();  // Add a new random value
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
