import 'dart:convert';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:get/get.dart';

class SuspendusController extends GetxController {
  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList suspandus = [].obs;
  //
  SuspenduConnexion suspenduConnexion = SuspenduConnexion();
  //
  //RxList suspandus = RxList();
  allSuspendu() async {
    Response rep = await suspenduConnexion.allDemandeur();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      suspandus.value = jsonDecode(rep.bodyString!);
      load.value = true;
      print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  updateDemandeur(Map<dynamic, dynamic> up) async {
    //
    Response rep = await suspenduConnexion.updateDemandeur(up);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      details.value = {}; //jsonDecode(rep.bodyString!);
      load.value = false;
      details.value = {}; //1
      allSuspendu(); //2
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

class SuspenduConnexion extends GetConnect {
  Future<Response> enregistreAgent(Map<String, dynamic> p) async => await post(
        "${Utils.url}/client/save",
        jsonEncode(p),
      );

  Future<Response> allDemandeur() async => await get(
        "${Utils.url}/client/allstarter/bloquer",
      );

  Future<Response> updateDemandeur(Map<dynamic, dynamic> up) async => await put(
        "${Utils.url}/client/update",
        jsonEncode(up),
      );
}
