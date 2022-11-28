import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_pattern/library/urlApi.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? dataQuery;
  final String? token;

  ApiRequest({required this.url, this.dataQuery, this.token});

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(baseUrl: ApiURL.baseUrl, headers: {
      'Bearer': token,
    }));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().get(url, queryParameters: dataQuery).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().post(url, data: dataQuery).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
