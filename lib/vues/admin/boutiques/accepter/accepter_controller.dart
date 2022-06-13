import 'dart:convert';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:get/get.dart';

class AccepterController extends GetxController {
  //
  DemandeurConnexion demandeurConnexion = DemandeurConnexion();
  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList accepter = RxList(); //allstarter
  //
  allAcceptes() async {
    Response rep = await demandeurConnexion.allDemandeur();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      accepter.value = jsonDecode(rep.bodyString!);
      load.value = true;
      print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  updateDemandeur(Map<dynamic, dynamic> up) async {
    //
    Response rep = await demandeurConnexion.updateDemandeur(up);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      details.value = {}; //jsonDecode(rep.bodyString!);
      load.value = false;
      details.value = {}; //1
      allAcceptes(); //2
      print("cool");
    } else {
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
        "${Utils.url}/client/allstarter/accepté",
      );

  Future<Response> updateDemandeur(Map<dynamic, dynamic> up) async => await put(
        "${Utils.url}/client/update",
        jsonEncode(up),
      );
}
