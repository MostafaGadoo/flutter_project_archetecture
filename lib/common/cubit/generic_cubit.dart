
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/api_result.dart';
import 'generic_cubit_state.dart';

enum ApiOperation { select, create, update, delete }

class GenericCubit<T> extends Cubit<GenericCubitState<T>> {
  GenericCubit() : super(GenericCubitState.empty());

  ApiOperation operation = ApiOperation.select;

  _checkFailureOrSuccess(ApiResult failureOrSuccess) {
    failureOrSuccess.when(
      failure: (String failure) {
        emit(GenericCubitState.failure(failure));
      },
      success: (value) {
        emit(GenericCubitState.success(value));
      },
    );
  }

  _apiOperationTemplate(Future<ApiResult> apiCallback) async {
    emit(GenericCubitState.loading());
    ApiResult failureOrSuccess = await apiCallback;
    _checkFailureOrSuccess(failureOrSuccess);
  }

  Future<void> createItem(Future<ApiResult> apiCallback) async {
    operation = ApiOperation.create;
    return _apiOperationTemplate(apiCallback);
  }

  Future<void> updateItem(Future<ApiResult> apiCallback) async {
    operation = ApiOperation.update;
    return _apiOperationTemplate(apiCallback);
  }

  Future<void> deleteItem(Future<ApiResult> apiCallback) async {
    operation = ApiOperation.delete;
    return _apiOperationTemplate(apiCallback);
  }

  Future<void> getItems(Future<ApiResult<T>> apiCallback) async {
    operation = ApiOperation.select;
    emit(GenericCubitState.loading());
    ApiResult<T> failureOrSuccess = await apiCallback;

    failureOrSuccess.when(
      failure: (String failure) {
        emit(GenericCubitState.failure(failure));
      },
      success: (T items) {
        if (items == null ) {
          emit(GenericCubitState.empty());
        } else {
          emit(GenericCubitState.success(items));
        }
      },
    );
  }
}
