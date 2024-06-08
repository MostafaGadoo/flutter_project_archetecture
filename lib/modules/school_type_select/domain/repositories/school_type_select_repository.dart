import '../../../../../common/network/api_result.dart';
import '../../data/models/school_type_select_model.dart';
import '../use_cases/school_type_select_usecase.dart';

abstract class SchoolTypeSelectRepository {
  Future<ApiResult<SchoolTypeSelectModel>> doSchoolTypeSelect({required GetSchoolTypeSelectParams schoolTypeSelectParams});
}
