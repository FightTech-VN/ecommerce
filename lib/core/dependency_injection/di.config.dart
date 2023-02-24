// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce/data/datasource/local/mock_data_local.dart' as _i3;
import 'package:ecommerce/data/responsitory/product_responsitory.impl.dart'
    as _i5;
import 'package:ecommerce/domain/responsitory/product_responsitory.dart' as _i4;
import 'package:ecommerce/domain/usecase/product_usecase.dart' as _i6;
import 'package:ecommerce/presenstation/home/bloc/home_bloc.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ProductMockApi>(() => _i3.ProductMockApi());
  gh.factory<_i4.ProductResponsitory>(
      () => _i5.ProductResponsitoryImpl(gh<_i3.ProductMockApi>()));
  gh.factory<_i6.ProductUsecase>(
      () => _i6.ProductUsecase(gh<_i4.ProductResponsitory>()));
  gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc(gh<_i6.ProductUsecase>()));
  return getIt;
}
