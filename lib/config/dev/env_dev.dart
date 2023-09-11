import 'package:envied/envied.dart';
import '../app_env.dart';
import '../app_env_fields.dart';

part 'env_dev.g.dart';

@Envied(name: 'Env', path: '.env_dev')
final class DevEnv implements AppEnv, AppEnvFields {
  const DevEnv();

  // @override
  // @EnviedField(varName: 'ENVIRONMENT', obfuscate: true)
  // final String environment = _Env.environment;

  @override
  @EnviedField(varName: 'ENVIRONMENT', obfuscate: true)
  String get environment => _Env.environment;
}
