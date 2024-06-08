import 'dart:io';

import 'package:dio/dio.dart' show  DioException, DioExceptionType;

import 'api_string.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioExceptions) {
    switch (dioExceptions.type) {
      case DioExceptionType.cancel:
        message = ApiStrings.cancelRequest;
        break;
      case DioExceptionType.connectionTimeout:
        message = ApiStrings.connectionTimeOut;
        break;
      case DioExceptionType.receiveTimeout:
        message = ApiStrings.receiveTimeOut;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioExceptions.response?.statusCode,
          dioExceptions.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = ApiStrings.sendTimeOut;
        break;
      case DioExceptionType.unknown:
        if (dioExceptions.error is SocketException) {
          message = ApiStrings.socketException;
          break;
        }
        message = ApiStrings.unexpectedError;
        break;
      default:
        message = ApiStrings.unknownError;
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return ApiStrings.badRequest;
      case 401:
        return ApiStrings.unauthorized;
      case 403:
        return ApiStrings.forbidden;
      case 404:
        return ApiStrings.notFound;
      case 422:
        return ApiStrings.duplicateEmail;
      case 500:
        return ApiStrings.internalServerError;
      case 502:
        return ApiStrings.badGateway;
      default:
        return ApiStrings.unknownError;
    }
  }

  @override
  String toString() => message;
}
