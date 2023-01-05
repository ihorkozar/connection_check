import 'package:connection_check/sl/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  Future<InternetConnectionCheckerPlus> get internetChecker async =>
      InternetConnectionCheckerPlus();
}
