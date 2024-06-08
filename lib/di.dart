import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'common/network/dio_client.dart';


final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  initCubits();
  initUseCases();
  initRepos();
  initDataSources();
  initDio();
}

initCubits() {
  // getIt.registerFactory(
  //         () => SchoolTypeSelectCubit(schoolTypeSelectUseCase: getIt<SchoolTypeSelectUseCase>()));
  // getIt.registerFactory(
  //         () => GetSchoolsCubit(getSchoolsUseCase: getIt<GetSchoolsUseCase>()));
  // getIt.registerFactory(
  //         () => SchoolTypeSelectCubit(schoolTypeSelectUseCase: getIt<SchoolTypeSelectUseCase>()));
}

initUseCases() {
  // getIt
  //     .registerLazySingleton(() => SchoolTypeSelectUseCase(getIt<SchoolTypeSelectRepository>()));
  // getIt
  //     .registerLazySingleton(() => GetSchoolsUseCase(getIt<GetSchoolsRepository>()));

}

initRepos() {
  // getIt.registerLazySingleton<GetSchoolsRepository>(
  //       () => GetSchoolsRepositoryImpl(remoteDataSource: getIt()),
  // );
}

initDataSources() {
  // getIt.registerLazySingleton<GetSchoolsRemoteDataSource>(
  //       () => GetSchoolsRemoteDataSourceImpl(),
  // );
  // getIt.registerLazySingleton<SchoolTypeSelectRemoteDataSource>(
  //       () => SchoolTypeSelectRemoteDataSourceImpl(),
  // );
}

initDio() {
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<Dio>(() => Dio());
}