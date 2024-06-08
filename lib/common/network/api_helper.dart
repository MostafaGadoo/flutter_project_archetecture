import 'package:dio/dio.dart';
import 'dart:convert';
import 'dio_exception.dart';
import 'package:real_state/core/extensions/int_extension.dart';


mixin ApiHelper<T> {
  late final T data;

  Future<T> _requestMethodTemplate(
      Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode.success ) {
      var data =  json.decode(json.encode(response.data));
      // print(KycResponseModel.fromJson(response.data));
      final T item =   getJsonCallback(data);
      return item;
    } else {
      throw DioExceptions;
    }
  }

  //Generic Method template for create item on server
  Future<T> makePostRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    return _requestMethodTemplate(apiCallback,getJsonCallback);
  }

  //Generic Method template for update item on server
  Future<T> makePutRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    return _requestMethodTemplate(apiCallback,getJsonCallback);
  }

  //Generic Method template for delete item from server
  Future<T> makeDeleteRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    return _requestMethodTemplate(apiCallback,getJsonCallback);
  }

  //Generic Method template for get item from server
  Future<T> makeGetRequest (Future<Response<dynamic>> apiCallback,
  T Function(Map<String, dynamic> json) getJsonCallback) async {
    return _requestMethodTemplate(apiCallback,getJsonCallback);
  }

  //Generic Method template for getting data list from Api
  Future<List<T>> makeGetListRequest(Future<Response<dynamic>> apiCallback,
  T Function(Map<String, dynamic> json) getJsonCallback) async {
  final Response response = await apiCallback;

  final List<T> items = List<T>.from(
  json
      .decode(json.encode(response.data))
      .map((item) => getJsonCallback(item)),
  );
  if (response.statusCode.success) {
  return items;
  } else {
  throw DioExceptions;
  }
  }
}
