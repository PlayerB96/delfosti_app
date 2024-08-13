import 'package:puntossmart_usuarios/app/data/model/login/credential.dart';
import 'package:puntossmart_usuarios/app/data/provider/login_provider.dart';

class LoginRepository {
  LoginProvider loginProvider = LoginProvider();

  Future<Credential> getCred(String us, String pa) async {
    final raw = await loginProvider.getCred(us, pa);
    final body = raw.body;
    final credential = Credential.fromJson(body);
    return credential;
  }
}
