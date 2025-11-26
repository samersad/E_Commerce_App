// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/api_services.dart' as _i124;
import '../api/data_sources/remote/auth/auth_remote_data_source_impl.dart'
    as _i983;
import '../api/data_sources/remote/category/brands_remote_data_source_impl.dart'
    as _i456;
import '../api/data_sources/remote/category/category_remote_data_source_impl.dart'
    as _i942;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/auth_remote_data_source.dart' as _i354;
import '../data/data_sources/remote/brands/brands_remote_data_source.dart'
    as _i1058;
import '../data/data_sources/remote/category/category_remote_data_source.dart'
    as _i212;
import '../data/repositories/auth/auth_repository_impl.dart' as _i27;
import '../data/repositories/brands/brands_repository_impl.dart' as _i292;
import '../data/repositories/category/category_repository_impl.dart' as _i478;
import '../domain/repositories/auth/auth_repository.dart' as _i1064;
import '../domain/repositories/brands/brands_repository.dart' as _i354;
import '../domain/repositories/category/category_repository.dart' as _i579;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i823;
import '../domain/use_cases/get_all_gategories_use_case.dart' as _i270;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/pages/home_screen/cubit/home_screen_view_model.dart'
    as _i845;
import '../features/ui/pages/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i635;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i845.HomeScreenViewModel>(() => _i845.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i124.ApiServices>(
      () => getItModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i354.AuthRemoteDataSource>(
      () =>
          _i983.AuthRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i1058.BrandsRemoteDataSource>(
      () => _i456.BrandsRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i212.CategoryRemoteDataSource>(
      () => _i942.CategoryRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i579.CategoryRepository>(
      () => _i478.CategoryRepositoryImpl(
        remoteDataSource: gh<_i212.CategoryRemoteDataSource>(),
      ),
    );
    gh.factory<_i1064.AuthRepository>(
      () => _i27.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i354.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i354.BrandsRepository>(
      () => _i292.BrandsRepositoryImpl(
        remoteDataSource: gh<_i1058.BrandsRemoteDataSource>(),
      ),
    );
    gh.factory<_i826.LoginUseCase>(
      () => _i826.LoginUseCase(authRepository: gh<_i1064.AuthRepository>()),
    );
    gh.factory<_i772.RegisterUseCase>(
      () => _i772.RegisterUseCase(authRepository: gh<_i1064.AuthRepository>()),
    );
    gh.factory<_i270.GetAllCategoriesUseCase>(
      () => _i270.GetAllCategoriesUseCase(
        categoryRepository: gh<_i579.CategoryRepository>(),
      ),
    );
    gh.factory<_i586.RegisterViewModel>(
      () =>
          _i586.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()),
    );
    gh.factory<_i823.GetAllBrandsUseCase>(
      () => _i823.GetAllBrandsUseCase(
        brandsRepository: gh<_i354.BrandsRepository>(),
      ),
    );
    gh.factory<_i1040.LoginViewModel>(
      () => _i1040.LoginViewModel(loginUseCase: gh<_i826.LoginUseCase>()),
    );
    gh.factory<_i635.HomeTabViewModel>(
      () => _i635.HomeTabViewModel(
        getAllCategoriesUseCase: gh<_i270.GetAllCategoriesUseCase>(),
        getAllBrandsUseCase: gh<_i823.GetAllBrandsUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
