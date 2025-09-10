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
import '../module/dio_module.dart' as _i545;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i1033.LoginApiClient>(
      () => _i1033.LoginApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i493.LoginRemoteDataSource>(
      () => _i444.LoginRemoteDateSourceImpl(gh<_i1033.LoginApiClient>()),
    );
    gh.factory<_i261.LoginRepo>(
      () => _i536.LoginRepoImpl(gh<_i493.LoginRemoteDataSource>()),
    );
    gh.factory<_i726.LoginUseCase>(
      () => _i726.LoginUseCase(gh<_i261.LoginRepo>()),
    );
    gh.factory<_i739.LoginCubit>(
      () => _i739.LoginCubit(gh<_i726.LoginUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i545.DioModule {}
