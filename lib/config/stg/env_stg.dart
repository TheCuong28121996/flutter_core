import 'package:envied/envied.dart';

import '../app_env.dart';
import '../app_env_fields.dart';

part 'env_stg.g.dart';

@Envied(path: '.env_stg')
final class StgEnv implements AppEnv, AppEnvFields {
  const StgEnv();

  @override
  @EnviedField(varName: 'ENVIRONMENT')
  String get environment => _StgEnv.environment;

  // @override
  // @EnviedField(varName: 'ENVIRONMENT', obfuscate: true)
  // final String environment = _Env.environment;
}