import 'package:puntossmart_usuarios/app/data/model/units/units.dart';
import 'package:puntossmart_usuarios/app/data/provider/home_provider.dart';

class HomeRepository {
  HomeProvider unitsProvider = HomeProvider();

  Future<Units> getUnits({
    required String token,
  }) async {
    final raw = await unitsProvider.getUnits(token: token);
    final body = raw.body;
    final units = Units.fromJson(body);
    // print(body);
    return units;
  }
}
