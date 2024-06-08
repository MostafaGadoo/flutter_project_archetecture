import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../../../../../common/cubit/generic_cubit.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/local_storage.dart';


import '../../data/models/school_type_select_model.dart';
import '../../domain/use_cases/school_type_select_usecase.dart';

class SchoolTypeSelectCubit extends GenericCubit<SchoolTypeSelectModel> {
  final SchoolTypeSelectUseCase schoolTypeSelectUseCase;
  String? userAuthKey;
  SchoolTypeSelectCubit({required this.schoolTypeSelectUseCase});

  List<SchoolTypeSelectModel> schools = [];

  Future<void> doSchoolTypeSelect() async {
    // var userModel = await LocalStorage().getUser();
    //
    // if (userModel != null) {
    //   userAuthKey = userModel.authKey!;
    // }
    // createItem(schoolTypeSelectUseCase.call(GetSchoolTypeSelectParams(authKey: userAuthKey!)));
    schools = getItems(schoolTypeSelectUseCase.call(GetSchoolTypeSelectParams())) as List<SchoolTypeSelectModel>;
    debugPrint('Schools: ${jsonEncode(schools)}');
  }
}

// Your LogoutState classes might look like this
abstract class SchoolTypeSelectState {}

class SchoolTypeSelectInitial extends SchoolTypeSelectState {}

class SchoolTypeSelectSuccess extends SchoolTypeSelectState {}

class SchoolTypeSelectFailure extends SchoolTypeSelectState {
  final String errorMessage;

  SchoolTypeSelectFailure(this.errorMessage);
}
