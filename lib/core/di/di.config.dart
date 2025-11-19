// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/ApiManager.dart' as _i695;
import '../../api/datasource/auth_remote_data_source_impl.dart' as _i462;
import '../../api/datasource/BrandsDataSourceImpl.dart' as _i198;
import '../../api/datasource/CategoriesOnlineDatasourceImpl.dart' as _i954;
import '../../api/datasource/ProductsOnlineDataSourceImpl.dart' as _i957;
import '../../data/datasource/auth_remote_data_source.dart' as _i169;
import '../../data/datasource/BrandsOnlineDataSource.dart' as _i65;
import '../../data/datasource/CategoriesOnlineDatasource.dart' as _i15;
import '../../data/datasource/ProductsOnlineDataSource.dart' as _i1061;
import '../../data/repos/auth_repo_impl.dart' as _i666;
import '../../data/repos/BrandsRepoImpl.dart' as _i1002;
import '../../data/repos/CategoriesRepoImpl.dart' as _i404;
import '../../data/repos/ProductsRepoImpl.dart' as _i315;
import '../../domain/repos/auth_repository.dart' as _i638;
import '../../domain/repos/BrandsRepo.dart' as _i120;
import '../../domain/repos/CategoriesRepo.dart' as _i374;
import '../../domain/repos/ProductsRepo.dart' as _i902;
import '../../domain/useCase/GetBrandsUsecase.dart' as _i486;
import '../../domain/useCase/GetCategoriesUsecase.dart' as _i644;
import '../../domain/useCase/GetProductsUseCase.dart' as _i517;
import '../../domain/useCase/login_use_case.dart' as _i84;
import '../../features/auth/presentation/view_model/login_view_model.dart'
    as _i269;
import '../../features/main_layout/home/presentation/HomeViewModel.dart' as _i9;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i695.ApiManager>(() => _i695.ApiManager());
    gh.factory<_i65.BrandsOnlineDataSource>(
      () => _i198.BrandsDataSourceImpl(gh<_i695.ApiManager>()),
    );
    gh.factory<_i15.CategoriesOnlineDataSource>(
      () => _i954.CategoriesOnlineDataSourceImpl(gh<_i695.ApiManager>()),
    );
    gh.factory<_i169.AuthRemoteDataSource>(
      () => _i462.AuthRemoteDataSourceImpl(gh<_i695.ApiManager>()),
    );
    gh.factory<_i1061.ProductsOnlineDataSource>(
      () => _i957.ProductsOnlineDataSourceImpl(gh<_i695.ApiManager>()),
    );
    gh.factory<_i120.BrandsRepo>(
      () => _i1002.BrandsRepoImpl(gh<_i65.BrandsOnlineDataSource>()),
    );
    gh.factory<_i638.AuthRepository>(
      () => _i666.AuthRepoImpl(gh<_i169.AuthRemoteDataSource>()),
    );
    gh.factory<_i374.CategoriesRepo>(
      () => _i404.CategoriesRepoImpl(gh<_i15.CategoriesOnlineDataSource>()),
    );
    gh.factory<_i644.GetCategoriesUseCase>(
      () => _i644.GetCategoriesUseCase(gh<_i374.CategoriesRepo>()),
    );
    gh.factory<_i902.ProductsRepo>(
      () => _i315.ProductsRepoImpl(gh<_i1061.ProductsOnlineDataSource>()),
    );
    gh.factory<_i84.LoginUseCase>(
      () => _i84.LoginUseCase(gh<_i638.AuthRepository>()),
    );
    gh.factory<_i269.LoginViewModel>(
      () => _i269.LoginViewModel(gh<_i84.LoginUseCase>()),
    );
    gh.factory<_i486.GetBrandsUseCase>(
      () => _i486.GetBrandsUseCase(gh<_i120.BrandsRepo>()),
    );
    gh.factory<_i517.GetProductsUseCase>(
      () => _i517.GetProductsUseCase(gh<_i902.ProductsRepo>()),
    );
    gh.factory<_i9.HomeViewModel>(
      () => _i9.HomeViewModel(
        gh<_i644.GetCategoriesUseCase>(),
        gh<_i486.GetBrandsUseCase>(),
        gh<_i517.GetProductsUseCase>(),
      ),
    );
    return this;
  }
}
