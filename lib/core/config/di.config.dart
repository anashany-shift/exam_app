// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/auth/forget_password/api/client/forget_password_api_client.dart'
    as _i585;
import '../../feature/auth/forget_password/api/datasource_impl/forget_password_datasource_impl.dart'
    as _i547;
import '../../feature/auth/forget_password/data/datasources/forget_password_datasource.dart'
    as _i57;
import '../../feature/auth/forget_password/data/repo_impl/forget_password_repo_impl.dart'
    as _i1049;
import '../../feature/auth/forget_password/domain/repos/forget_password_repo.dart'
    as _i654;
import '../../feature/auth/forget_password/domain/useCases/enter_email_useCase.dart'
    as _i739;
import '../../feature/auth/forget_password/domain/useCases/reset_password_useCase.dart'
    as _i705;
import '../../feature/auth/forget_password/domain/useCases/verify_code_useCase.dart'
    as _i479;
import '../../feature/auth/forget_password/presentation/view_model/forget_password_cubit.dart'
    as _i609;
import '../../feature/auth/login/api/client/login_api_client.dart' as _i1033;
import '../../feature/auth/login/api/datasource_impl/login_remote_datasource_impl.dart'
    as _i444;
import '../../feature/auth/login/data/datasources/login_remote_data_source.dart'
    as _i493;
import '../../feature/auth/login/data/repos_impl/login_repo_impl.dart' as _i536;
import '../../feature/auth/login/domain/repos/login_repo.dart' as _i261;
import '../../feature/auth/login/domain/useCases/login_use_case.dart' as _i726;
import '../../feature/auth/login/presentation/view_model/login_cubit.dart'
    as _i739;
import '../../feature/auth/sign_up/api/client/signup_api_client.dart' as _i48;
import '../../feature/auth/sign_up/api/datasuource_impl/signup_remote_datasource_impl.dart'
    as _i678;
import '../../feature/auth/sign_up/data/data_source.dart/signup_remote_datasource.dart'
    as _i323;
import '../../feature/auth/sign_up/data/repo_impl/signup_repo_impl.dart'
    as _i578;
import '../../feature/auth/sign_up/domain/repos/signup_repo.dart' as _i53;
import '../../feature/auth/sign_up/domain/useCases/signup_usecase.dart'
    as _i1049;
import '../../feature/auth/sign_up/view/view_model/signup_cubit.dart' as _i353;
import '../../feature/exam/api/client/exam_api_client.dart' as _i716;
import '../../feature/exam/api/datasource_impl/exam_remote_datasource_impl.dart'
    as _i920;
import '../../feature/exam/data/datasource/exam_remote_datasource.dart'
    as _i936;
import '../../feature/exam/data/repo_impl/exam_repo_impl.dart' as _i304;
import '../../feature/exam/domain/repo/exam_repo.dart' as _i903;
import '../../feature/exam/domain/useCases/get_question_useCase.dart' as _i495;
import '../../feature/exam/presentation/view_model/exam_cubit.dart' as _i497;
import '../../feature/exam/presentation/view_model/timer_cubit/timer_cubit.dart'
    as _i482;
import '../../feature/main_layout/explore/api/client/subjects_api_client.dart'
    as _i45;
import '../../feature/main_layout/explore/api/datasource_impl/subjects_remote_data_source_impl.dart'
    as _i152;
import '../../feature/main_layout/explore/data/datasources/remote_datasource/subject_remote_data_source.dart'
    as _i17;
import '../../feature/main_layout/explore/data/repo_impl/subjects_repo_impl.dart'
    as _i679;
import '../../feature/main_layout/explore/domain/repos/subjects_repo.dart'
    as _i508;
import '../../feature/main_layout/explore/domain/useCases/get_subjects_useCase.dart'
    as _i643;
import '../../feature/main_layout/explore/presentation/view_model/explore_cubit.dart'
    as _i399;
import '../../feature/subject/api/client/subject_exam_api_client.dart'
    as _i1015;
import '../../feature/subject/api/data_source_impl/subject_exam_remote_data_source_impl.dart'
    as _i594;
import '../../feature/subject/data/datasources/subject_exam_remote_data_source.dart'
    as _i231;
import '../../feature/subject/data/repo_impl/subject_exam_repo_impl.dart'
    as _i918;
import '../../feature/subject/domain/repos/subject_exam_repo.dart' as _i758;
import '../../feature/subject/domain/useCases/subject_exam_useCase.dart'
    as _i1030;
import '../../feature/subject/presentation/view_model/subject_exam_cubit.dart'
    as _i757;
import '../module/dio_module.dart' as _i545;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i482.TimerCubit>(() => _i482.TimerCubit());
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i585.ForgetPasswordApiClient>(
      () => _i585.ForgetPasswordApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i1033.LoginApiClient>(
      () => _i1033.LoginApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i48.SignupApiClient>(
      () => _i48.SignupApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i45.SubjectsApiClient>(
      () => _i45.SubjectsApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i1015.SubjectExamApiClient>(
      () => _i1015.SubjectExamApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i716.ExamApiClient>(
      () => _i716.ExamApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i57.ForgetPasswordDataSource>(
      () => _i547.ForgetPasswordDataSourceImpl(
        gh<_i585.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i654.ForgetPasswordRepo>(
      () => _i1049.ForgetPasswordRepoImpl(gh<_i57.ForgetPasswordDataSource>()),
    );
    gh.factory<_i936.ExamRemoteDataSource>(
      () => _i920.ExamRemoteDataSourceImpl(gh<_i716.ExamApiClient>()),
    );
    gh.factory<_i739.EnterEmailUseCase>(
      () => _i739.EnterEmailUseCase(gh<_i654.ForgetPasswordRepo>()),
    );
    gh.factory<_i705.ResetPasswordUseCase>(
      () => _i705.ResetPasswordUseCase(gh<_i654.ForgetPasswordRepo>()),
    );
    gh.factory<_i479.VerifyCodeUseCase>(
      () => _i479.VerifyCodeUseCase(gh<_i654.ForgetPasswordRepo>()),
    );
    gh.factory<_i903.ExamRepo>(
      () => _i304.ExamRepoImpl(gh<_i936.ExamRemoteDataSource>()),
    );
    gh.factory<_i493.LoginRemoteDataSource>(
      () => _i444.LoginRemoteDateSourceImpl(gh<_i1033.LoginApiClient>()),
    );
    gh.factory<_i231.SubjectExamRemoteDataSource>(
      () => _i594.SubjectExamRemoteDataSourceImpl(
        gh<_i1015.SubjectExamApiClient>(),
      ),
    );
    gh.factory<_i17.SubjectsRemoteDataSource>(
      () => _i152.SubjectsRemoteDataSourceImpl(gh<_i45.SubjectsApiClient>()),
    );
    gh.factory<_i758.SubjectExamRepo>(
      () => _i918.SubjectExamRepoImpl(gh<_i231.SubjectExamRemoteDataSource>()),
    );
    gh.factory<_i323.SignupRemoteDatasource>(
      () => _i678.SignupRemoteDatasourceImpl(gh<_i48.SignupApiClient>()),
    );
    gh.factory<_i261.LoginRepo>(
      () => _i536.LoginRepoImpl(gh<_i493.LoginRemoteDataSource>()),
    );
    gh.factory<_i1030.SubjectExamUseCase>(
      () => _i1030.SubjectExamUseCase(gh<_i758.SubjectExamRepo>()),
    );
    gh.factory<_i495.GetQuestionUseCase>(
      () => _i495.GetQuestionUseCase(gh<_i903.ExamRepo>()),
    );
    gh.factory<_i726.LoginUseCase>(
      () => _i726.LoginUseCase(gh<_i261.LoginRepo>()),
    );
    gh.factory<_i508.SubjectsRepo>(
      () => _i679.SubjectsRepoImpl(gh<_i17.SubjectsRemoteDataSource>()),
    );
    gh.factory<_i609.ForgetPasswordCubit>(
      () => _i609.ForgetPasswordCubit(
        gh<_i739.EnterEmailUseCase>(),
        gh<_i479.VerifyCodeUseCase>(),
        gh<_i705.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i739.LoginCubit>(
      () => _i739.LoginCubit(gh<_i726.LoginUseCase>()),
    );
    gh.factory<_i757.SubjectExamCubit>(
      () => _i757.SubjectExamCubit(gh<_i1030.SubjectExamUseCase>()),
    );
    gh.factory<_i497.ExamCubit>(
      () => _i497.ExamCubit(gh<_i495.GetQuestionUseCase>()),
    );
    gh.factory<_i53.SignupRepo>(
      () => _i578.SignupRepoImpl(
        signupRemoteDatasource: gh<_i323.SignupRemoteDatasource>(),
      ),
    );
    gh.factory<_i643.GetSubjectUseCase>(
      () => _i643.GetSubjectUseCase(gh<_i508.SubjectsRepo>()),
    );
    gh.factory<_i399.ExploreCubit>(
      () => _i399.ExploreCubit(gh<_i643.GetSubjectUseCase>()),
    );
    gh.factory<_i1049.SignupUseCase>(
      () => _i1049.SignupUseCase(gh<_i53.SignupRepo>()),
    );
    gh.factory<_i353.SignupCubit>(
      () => _i353.SignupCubit(gh<_i1049.SignupUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i545.DioModule {}
