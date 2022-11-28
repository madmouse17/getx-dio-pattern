import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/home/Models/homeModels.dart';
import 'package:getx_pattern/app/modules/home/providers/homeProvider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var homeList = <HomeModels>[].obs;

  getHomeList() {
    HomeProvider().getHomeList(
      onSuccess: (value) {
        print(value[0].id);

        homeList.value = value;
        update();
      },
      onError: (error) {
        //  isLoading = false;
        update();
        print(error);
      },
    );
  }

  @override
  void onInit() {
    getHomeList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
