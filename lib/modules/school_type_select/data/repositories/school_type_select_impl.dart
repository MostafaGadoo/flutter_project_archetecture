import '../../../../common/network/api_result.dart';
import '../../../../common/repository/repository_helper.dart';
import '../../domain/use_cases/school_type_select_usecase.dart';
import '../data_sources/school_type_remote_data_source.dart';
import '../models/school_type_select_model.dart';
import '../../domain/repositories/school_type_select_repository.dart';

class SchoolTypeSelectRepositoryImpl extends SchoolTypeSelectRepository
    with RepositoryHelper<SchoolTypeSelectModel> {
  final SchoolTypeSelectRemoteDataSource remoteDataSource;

  SchoolTypeSelectRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<SchoolTypeSelectModel>> doSchoolTypeSelect(
      {required GetSchoolTypeSelectParams schoolTypeSelectParams}) {
    return checkItemFailOrSuccess(remoteDataSource.doSchoolTypeSelect(
        schoolTypeSelectParams: schoolTypeSelectParams));
  }
}
