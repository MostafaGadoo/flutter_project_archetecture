
import '../../../../../common/network/api_helper.dart';
import '../../../../../common/network/dio_client.dart';
import '../../../../../di.dart';
import '../../../../common/network/api_config.dart';
import '../../domain/use_cases/school_type_select_usecase.dart';
import '../models/school_type_select_model.dart';


abstract class SchoolTypeSelectRemoteDataSource {
  Future<SchoolTypeSelectModel> doSchoolTypeSelect(
      {required GetSchoolTypeSelectParams schoolTypeSelectParams});
}
class SchoolTypeSelectRemoteDataSourceImpl with ApiHelper<SchoolTypeSelectModel> implements SchoolTypeSelectRemoteDataSource {
  final DioClient dioClient = getIt<DioClient>();

  @override
  Future<SchoolTypeSelectModel> doSchoolTypeSelect(
      {required GetSchoolTypeSelectParams schoolTypeSelectParams}) async {
    Map<String, dynamic> data = <String, dynamic>{};
    data.addAll({
      "data": {

      }
    });
    dioClient.dio.options.headers = <String, dynamic>{
    };
    return await makePostRequest(
        dioClient.dio.post(ApiConfig.getSchools, data: data),
        SchoolTypeSelectModel.fromJson);
  }
}
