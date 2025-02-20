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
import '../../data/data_sources/GetAllCategories_remote_dataSource_impl.dart'
    as _i559;
import '../../data/data_sources/GetAllProducts_remote_dataSource_impl.dart'
    as _i651;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/getAllCategories_repository_impl.dart' as _i338;
import '../../data/repository/getAllProducts_repository_impl.dart' as _i634;
import '../../domain/repositories/dataSource/auth_remote_dataSource.dart'
    as _i102;
import '../../domain/repositories/dataSource/getAllCategories_remote_dataSource.dart'
    as _i921;
import '../../domain/repositories/dataSource/getAllProduct_remote_dataSource.dart'
    as _i989;
import '../../domain/repositories/repository/auth_repository.dart' as _i648;
import '../../domain/repositories/repository/getAllCategories_repository.dart'
    as _i732;
import '../../domain/repositories/repository/getAllProduct_repository.dart'
    as _i135;
import '../../domain/usecases/getAllCategories_useCase.dart' as _i470;
import '../../domain/usecases/getAllProducts_useCase.dart' as _i507;
import '../../domain/usecases/getProductsByCategory_useCase.dart' as _i813;
import '../../domain/usecases/login_useCase.dart' as _i839;
import '../../domain/usecases/register_useCase.dart' as _i216;
import '../../ui/auth/login/cubit/login_viewModel.dart' as _i999;
import '../../ui/auth/register/cubit/register_viewModel.dart' as _i1056;
import '../../ui/explorer_tab/cubit/explorer_tab_viewModel.dart' as _i693;
import '../../ui/home_tab/cubit/home_tab_viewModel.dart' as _i53;

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
    gh.factory<_i989.GetAllProductRemoteDatasource>(
        () => _i651.GetAllProductsRemoteDatasourceImpl(gh<_i254.ApiManger>()));
    gh.factory<_i921.GetAllCategoriesRemoteDatasource>(() =>
        _i559.GetAllCategoriesRemoteDatasourceImpl(gh<_i254.ApiManger>()));
    gh.factory<_i507.GetAllProductsUseCase>(() =>
        _i507.GetAllProductsUseCase(gh<_i989.GetAllProductRemoteDatasource>()));
    gh.factory<_i813.GetProductsByCategoryUseCase>(() =>
        _i813.GetProductsByCategoryUseCase(
            gh<_i989.GetAllProductRemoteDatasource>()));
    gh.factory<_i135.GetAllProductRepository>(() =>
        _i634.GetAllProductsRepositoryImpl(
            gh<_i989.GetAllProductRemoteDatasource>()));
    gh.factory<_i102.AuthRemoteDatasource>(
        () => _i482.AuthRemoteDatasourceImpl(gh<_i254.ApiManger>()));
    gh.factory<_i732.GetAllCategoriesRepository>(() =>
        _i338.GetAllCategoriesRepositoryImpl(
            gh<_i921.GetAllCategoriesRemoteDatasource>()));
    gh.factory<_i648.AuthRepository>(
        () => _i581.AuthRepositoryImpl(gh<_i102.AuthRemoteDatasource>()));
    gh.factory<_i839.LoginUseCase>(
        () => _i839.LoginUseCase(gh<_i648.AuthRepository>()));
    gh.factory<_i216.RegisterUseCase>(
        () => _i216.RegisterUseCase(gh<_i648.AuthRepository>()));
    gh.factory<_i470.GetAllCategoriesUseCase>(() =>
        _i470.GetAllCategoriesUseCase(gh<_i732.GetAllCategoriesRepository>()));
    gh.factory<_i999.LoginViewmodel>(
        () => _i999.LoginViewmodel(gh<_i839.LoginUseCase>()));
    gh.factory<_i693.ExplorerTabViewmodel>(
        () => _i693.ExplorerTabViewmodel(gh<_i507.GetAllProductsUseCase>()));
    gh.factory<_i1056.RegisterViewmodel>(
        () => _i1056.RegisterViewmodel(gh<_i216.RegisterUseCase>()));
    gh.factory<_i53.HomeTabViewmodel>(() => _i53.HomeTabViewmodel(
          gh<_i470.GetAllCategoriesUseCase>(),
          gh<_i813.GetProductsByCategoryUseCase>(),
        ));
    return this;
  }
}
