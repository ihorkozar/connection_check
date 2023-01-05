// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connection_check/connection_bloc/connection_bloc.dart' as _i4;
import 'package:connection_check/sl/injection.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i3;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.InternetConnectionCheckerPlus>(
      () => registerModule.internetChecker,
      preResolve: true,
    );
    gh.factory<_i4.ConnectionBloc>(() => _i4.ConnectionBloc(
        internetConnectionChecker: gh<_i3.InternetConnectionCheckerPlus>()));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
