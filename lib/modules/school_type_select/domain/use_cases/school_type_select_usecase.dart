import '../../../../../common/network/api_result.dart';
import '../../../../../common/usecase/usecase.dart';
import '../../data/models/school_type_select_model.dart';
import '../repositories/school_type_select_repository.dart';

class SchoolTypeSelectUseCase implements UseCase<SchoolTypeSelectModel, GetSchoolTypeSelectParams> {
  final SchoolTypeSelectRepository schoolTypeSelectRepository;

  const SchoolTypeSelectUseCase(this.schoolTypeSelectRepository);

  @override
  Future<ApiResult<SchoolTypeSelectModel>> call(GetSchoolTypeSelectParams schoolTypeSelectParams) async {
    return await schoolTypeSelectRepository.doSchoolTypeSelect(schoolTypeSelectParams: schoolTypeSelectParams);
  }
}
class GetSchoolTypeSelectParams {
  // final String authKey;
  //
  // GetSchoolTypeSelectParams({required this.authKey});
}
