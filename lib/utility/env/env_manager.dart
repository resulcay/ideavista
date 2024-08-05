import 'package:envied/envied.dart';

part 'env_manager.g.dart';

@Envied(path: 'assets/env/.env.dev')
abstract class EnvManager {
  @EnviedField(varName: 'APIKEY', obfuscate: true)
  static String apiKey = _EnvManager.apiKey;

  @EnviedField(varName: 'IMAGEBASEURL', obfuscate: true)
  static String imageBaseUrl = _EnvManager.imageBaseUrl;

  @EnviedField(varName: 'VIDEOBASEURL', obfuscate: true)
  static String videoBaseUrl = _EnvManager.videoBaseUrl;
}
