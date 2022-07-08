import 'package:africulture_desktop/utils/utils.dart';
import 'package:get/get.dart';

class ListageConnexion extends GetConnect {
  Future<Response> load() async => await get("${Utils.url}/client/all");
}
