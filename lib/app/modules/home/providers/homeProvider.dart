import 'dart:convert';
import 'dart:developer';

import 'package:getx_pattern/app/modules/home/Models/homeModels.dart';
import 'package:getx_pattern/library/apiRequest.dart';
import 'package:getx_pattern/library/urlApi.dart';

class HomeProvider {
  void getHomeList({
    Function()? beforeSend,
    Function(List<HomeModels> value)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: ApiURL.post, dataQuery: null, token: null).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // log(data.toString());
        onSuccess!(homeModelsFromJson(jsonEncode(data)));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
