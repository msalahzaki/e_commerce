// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/api_manger.dart' as _i254;
import '../../data/data_sources/auth_remote_dataSource_impl.dart' as _i482;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../domain/repositories/dataSource/auth_remote_dataSource.dart'
    as _i102;
import '../../domain/repositories/repository/auth_repository.dart' as _i648;
import '../../domain/usecases/register_useCase.dart' as _i216;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i254.ApiManger>(() => _i254.ApiManger());
    gh.factory<_i102.AuthRemoteDatasource>(
        () => _i482.AuthRemoteDatasourceImpl(gh<_i254.ApiManger>()));
    gh.factory<_i648.AuthRepository>(
        () => _i581.AuthRepositoryImpl(gh<_i102.AuthRemoteDatasource>()));
    gh.factory<_i216.RegisterUseCase>(
        () => _i216.RegisterUseCase(gh<_i648.AuthRepository>()));
    return this;
  }
}
