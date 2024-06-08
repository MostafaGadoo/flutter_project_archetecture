import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  LocalStorage._internal();

  factory LocalStorage() => _instance;

  final _storage = const FlutterSecureStorage();

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<void> setBiometrics({required bool value}) async {
    await _storage.write(
      key: 'AppConstants.biometricsKey',
      value: value.toString(),
    );
  }

  Future<bool?> getBiometrics() async {
    final result = await _storage.read(key: 'AppConstants.biometricsKey');
    if (result != null) {
      return result == 'true';
    }
    return null;
  }

  Future<void> setNationalID({required String value}) async {
    await _storage.write(
      key: 'AppConstants.nationalIdKey',
      value: value,
    );
  }

  Future<String?> getNationalID() async {
    final result = await _storage.read(key: 'AppConstants.nationalIdKey');
    return result;
  }

  Future<void> setPassword({required String value}) async {
    await _storage.write(
      key: 'AppConstants.passwordKey',
      value: value,
    );
  }

  Future<String?> getPassword() async {
    final result = await _storage.read(key: 'AppConstants.passwordKey');
    return result;
  }

  Future<void> setMobileNumber({required String value}) async {
    await _storage.write(
      key: 'AppConstants.mobileKey',
      value: value,
    );
  }

  Future<String?> getMobileNumber() async {
    final result = await _storage.read(key: 'AppConstants.mobileKey');
    return result;
  }

  Future<void> setLanguage({required String value}) async {
    await _storage.write(
      key: 'AppConstants.language',
      value: value,
    );
  }

  Future<String?> getLanguage() async {
    final result = await _storage.read(key: 'AppConstants.language');
    return result;
  }

  Future<void> setToken({required String value}) async {
    await _storage.write(
      key: 'AppConstants.tokenKey',
      value: value,
    );
  }

  Future<String?> getToken() async {
    final result = await _storage.read(key: 'AppConstants.tokenKey');
    return result;
  }
  //
  // Future<void> setUser({required UserModel value}) async {
  //   await _storage.write(
  //     key: AppConstants.userCredentialsKey,
  //     value: jsonEncode(value.toJson()),
  //   );
  // }

  // Future<UserModel?> getUser() async {
  //   final result = await _storage.read(key: AppConstants.userCredentialsKey);
  //   if (result != null && result.isNotEmpty) {
  //     final userModel = UserModel.fromJson(json.decode(result));
  //     return userModel;
  //   }
  //   return null;
  // }

  // Future<void> deleteUser() async {
  //   await _storage.delete(key: AppConstants.userCredentialsKey);
  // }
}
