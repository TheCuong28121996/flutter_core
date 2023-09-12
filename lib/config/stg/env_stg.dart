import 'package:envied/envied.dart';

import '../app_env.dart';
import '../app_env_fields.dart';

part 'env_stg.g.dart';

@Envied(name: 'Env', path: '.env_stg')
final class StgEnv implements AppEnv, AppEnvFields {
  const StgEnv();

  @override
  @EnviedField(varName: 'environment', obfuscate: true)
  String get environment => _Env.environment;

  @override
  @EnviedField(varName: 'appKey', obfuscate: true)
  String get appKey => _Env.appKey;

  @override
  @EnviedField(varName: 'authUrl', obfuscate: true)
  String get authUrl => _Env.authUrl;

  @override
  @EnviedField(varName: 'boUrl', obfuscate: true)
  String get boUrl => _Env.boUrl;

  @override
  @EnviedField(varName: 'clientId', obfuscate: true)
  String get clientId => _Env.clientId;

  @override
  @EnviedField(varName: 'clientSecret', obfuscate: true)
  String get clientSecret => _Env.clientSecret;

  @override
  @EnviedField(varName: 'drupalBO', obfuscate: true)
  String get drupalBO => _Env.drupalBO;

  @override
  @EnviedField(varName: 'grantType', obfuscate: true)
  String get grantType => _Env.grantType;

  @override
  @EnviedField(varName: 'trackingUrl', obfuscate: true)
  String get trackingUrl => _Env.trackingUrl;
}
