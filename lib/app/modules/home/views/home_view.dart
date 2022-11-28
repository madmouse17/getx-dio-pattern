import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.homeList.length,
            itemBuilder: (BuildContext context, int index) {
              var data = controller.homeList[index];
              return ListTile(
                title: Text(data.title),
                subtitle: Text(data.body),
              );
            },
          ),
        ),
      ),
    );
  }
}
