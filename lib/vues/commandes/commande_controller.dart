import 'package:get/get.dart';

import 'dart:convert';
import 'package:africulture_desktop/utils/utils.dart';

class CommandeController extends GetxController {
  //
  DemandeurConnexion demandeurConnexion = DemandeurConnexion();
  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList standards = RxList(); //standards
  //
  RxList express = RxList(); //express
  //
  RxList historiques = RxList(); //historiques
  //
  getStandards() async {
    Response rep = await demandeurConnexion.getStandards();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //accepter.value = jsonDecode(rep.bodyString!);
      load.value = true;
      print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  getExpress() async {
    Response rep = await demandeurConnexion.getExpress();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //accepter.value = jsonDecode(rep.bodyString!);
      load.value = true;
      print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  getHistoriques() async {
    Response rep = await demandeurConnexion.getHistoriques();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //accepter.value = jsonDecode(rep.bodyString!);
      load.value = true;
      print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  //
  updateDemandeur(Map<dynamic, dynamic> up) async {
    //
    Response rep = await demandeurConnexion.updateDemandeur(up);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      details.value = {}; //jsonDecode(rep.bodyString!);
      load.value = false;
      details.value = {}; //1
      //allAcceptes(); //2
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

  Future<Response> getStandards() async => await get(
        "${Utils.url}/client/allstarter/accepté",
      );
  Future<Response> getExpress() async => await get(
        "${Utils.url}/client/allstarter/accepté",
      );
  Future<Response> getHistoriques() async => await get(
        "${Utils.url}/client/allstarter/accepté",
      );

  Future<Response> updateDemandeur(Map<dynamic, dynamic> up) async => await put(
        "${Utils.url}/client/update",
        jsonEncode(up),
      );
}
