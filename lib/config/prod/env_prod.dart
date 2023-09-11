import 'package:envied/envied.dart';

import '../app_env.dart';
import '../app_env_fields.dart';

part 'env_prod.g.dart';

@Envied(name: 'Env', path: '.env')
final class ProdEnv implements AppEnv, AppEnvFields {
  const ProdEnv();

  @override
  @EnviedField(varName: 'ENVIRONMENT', obfuscate: true)
  String get environment => _Env.environment;

  // @override
  // @EnviedField(varName: 'ENVIRONMENT', obfuscate: true)
  // final String environment = _Env.environment;
}
