import 'dart:convert';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:get/get.dart';

class DemandeurController extends GetxController {
  //
  DemandeurConnexion demandeurConnexion = DemandeurConnexion();
  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList demandeurs = RxList(); //allstarter
  //
  allDemandeurs() async {
    Response rep = await demandeurConnexion.allDemandeur();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      demandeurs.value = jsonDecode(rep.bodyString!);
      load.value = true;
      print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  updateDemandeur(Map<dynamic, dynamic> up) async {
    //
    Response rep = await demandeurConnexion.updateDemandeur(up);
    if (rep.isOk) {
      details.value = {}; //jsonDecode(rep.bodyString!);
      load.value = false;
      details.value = {}; //1
      allDemandeurs(); //2
      print("cool");
      Get.back();
      Get.snackbar("SUCCES", "Modification éffectué");
    } else {
      Get.back();
      Get.snackbar(
          "Erreur ", "Modification non éffectué, erreur: ${rep.statusCode}");
      load.value = false;
    }
  }
}

class DemandeurConnexion extends GetConnect {
  Future<Response> enregistreAgent(Map<String, dynamic> p) async => await post(
        "${Utils.url}/client/save",
        jsonEncode(p),
      );

  Future<Response> allDemandeur() async => await get(
        "${Utils.url}/client/allstarter/starter",
      );

  Future<Response> updateDemandeur(Map<dynamic, dynamic> up) async => await put(
        "${Utils.url}/client/update",
        jsonEncode(up),
      );
}
