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
import '../../data/data_sources/cart_dataSource_impl.dart' as _i379;
import '../../data/data_sources/GetAllCategories_remote_dataSource_impl.dart'
    as _i559;
import '../../data/data_sources/GetAllProducts_remote_dataSource_impl.dart'
    as _i651;
import '../../data/data_sources/wishList_dataSource_impl.dart' as _i659;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/cart_repository_impl.dart' as _i942;
import '../../data/repository/getAllCategories_repository_impl.dart' as _i338;
import '../../data/repository/getAllProducts_repository_impl.dart' as _i634;
import '../../data/repository/wishList_repository_impl.dart' as _i65;
import '../../domain/repositories/dataSource/auth_remote_dataSource.dart'
    as _i102;
import '../../domain/repositories/dataSource/cart_dataSource.dart' as _i192;
import '../../domain/repositories/dataSource/getAllCategories_remote_dataSource.dart'
    as _i921;
import '../../domain/repositories/dataSource/getAllProduct_remote_dataSource.dart'
    as _i989;
import '../../domain/repositories/dataSource/wishList_dataSource.dart' as _i982;
import '../../domain/repositories/repository/auth_repository.dart' as _i648;
import '../../domain/repositories/repository/cart_repository.dart' as _i919;
import '../../domain/repositories/repository/getAllCategories_repository.dart'
    as _i732;
import '../../domain/repositories/repository/getAllProduct_repository.dart'
    as _i135;
import '../../domain/repositories/repository/wishList_repository.dart' as _i151;
import '../../domain/usecases/addToCart_useCase.dart' as _i795;
import '../../domain/usecases/addToWishList_useCase.dart' as _i819;
import '../../domain/usecases/getAllCategories_useCase.dart' as _i470;
import '../../domain/usecases/getAllProducts_useCase.dart' as _i507;
import '../../domain/usecases/getCart_useCase.dart' as _i653;
import '../../domain/usecases/getProductsByCategory_useCase.dart' as _i813;
import '../../domain/usecases/getWishList_useCase.dart' as _i223;
import '../../domain/usecases/login_useCase.dart' as _i839;
import '../../domain/usecases/register_useCase.dart' as _i216;
import '../../domain/usecases/removeFromWishList_useCase.dart' as _i721;
import '../../domain/usecases/updateCartProductCount_useCase.dart' as _i911;
import '../../ui/auth/login/cubit/login_viewModel.dart' as _i999;
import '../../ui/auth/register/cubit/register_viewModel.dart' as _i1056;
import '../../ui/cart/cubit/cart_viewModel.dart' as _i606;
import '../../ui/explorer_tab/cubit/explorer_tab_viewModel.dart' as _i693;
import '../../ui/favorite_tab/cubit/wishlist_viewmodel.dart' as _i171;
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
    gh.factory<_i982.WishListDataSource>(
        () => _i659.WishListDataSourceImpl(gh<_i254.ApiManger>()));
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
    gh.factory<_i192.CartDatasource>(
        () => _i379.CartDatasourceImpl(gh<_i254.ApiManger>()));
    gh.factory<_i839.LoginUseCase>(
        () => _i839.LoginUseCase(gh<_i648.AuthRepository>()));
    gh.factory<_i216.RegisterUseCase>(
        () => _i216.RegisterUseCase(gh<_i648.AuthRepository>()));
    gh.factory<_i151.WishlistRepository>(
        () => _i65.WishlistRepositoryImpl(gh<_i982.WishListDataSource>()));
    gh.factory<_i470.GetAllCategoriesUseCase>(() =>
        _i470.GetAllCategoriesUseCase(gh<_i732.GetAllCategoriesRepository>()));
    gh.factory<_i999.LoginViewmodel>(
        () => _i999.LoginViewmodel(gh<_i839.LoginUseCase>()));
    gh.factory<_i919.CartRepository>(
        () => _i942.CartRepositoryImpl(gh<_i192.CartDatasource>()));
    gh.factory<_i1056.RegisterViewmodel>(
        () => _i1056.RegisterViewmodel(gh<_i216.RegisterUseCase>()));
    gh.factory<_i53.HomeTabViewmodel>(() => _i53.HomeTabViewmodel(
          gh<_i470.GetAllCategoriesUseCase>(),
          gh<_i813.GetProductsByCategoryUseCase>(),
        ));
    gh.factory<_i819.AddToWishListUseCase>(
        () => _i819.AddToWishListUseCase(gh<_i151.WishlistRepository>()));
    gh.factory<_i223.GetWishListUseCase>(
        () => _i223.GetWishListUseCase(gh<_i151.WishlistRepository>()));
    gh.factory<_i721.RemoveFromWishListUseCase>(
        () => _i721.RemoveFromWishListUseCase(gh<_i151.WishlistRepository>()));
    gh.factory<_i171.WishlistViewmodel>(() => _i171.WishlistViewmodel(
          gh<_i223.GetWishListUseCase>(),
          gh<_i721.RemoveFromWishListUseCase>(),
          gh<_i819.AddToWishListUseCase>(),
        ));
    gh.factory<_i795.AddToCartUseCase>(
        () => _i795.AddToCartUseCase(gh<_i919.CartRepository>()));
    gh.factory<_i653.GetCartUseCase>(
        () => _i653.GetCartUseCase(gh<_i919.CartRepository>()));
    gh.factory<_i911.UpdateCartProductCountUseCase>(
        () => _i911.UpdateCartProductCountUseCase(gh<_i919.CartRepository>()));
    gh.factory<_i693.ExplorerTabViewmodel>(() => _i693.ExplorerTabViewmodel(
          gh<_i507.GetAllProductsUseCase>(),
          gh<_i795.AddToCartUseCase>(),
        ));
    gh.factory<_i606.CartViewModel>(() => _i606.CartViewModel(
          gh<_i653.GetCartUseCase>(),
          gh<_i911.UpdateCartProductCountUseCase>(),
        ));
    return this;
  }
}
