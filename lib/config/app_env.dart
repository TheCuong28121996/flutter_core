import '../main.dart';
import 'app_env_fields.dart';
import 'dev/env_dev.dart';
import 'prod/env_prod.dart';
import 'stg/env_stg.dart';

abstract interface class AppEnv implements AppEnvFields {
  factory AppEnv() => _instance;

  static final AppEnv _instance =
      kDevEnv ?  const DevEnv() : (kStgEnv ?  const StgEnv() :  const ProdEnv());
}
