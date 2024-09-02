import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'Vectara_API_Key', obfuscate: true)
  static final String vectaraApiKey = _Env.vectaraApiKey;
}
