import 'package:get/get.dart';

import 'dart:convert';
import 'package:africulture_desktop/utils/utils.dart';

class EncoursController extends GetxController {
  //
  EncoursConnexion demandeurConnexion = EncoursConnexion();
  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList standards = RxList(); //standards
  //
  RxList l = [].obs;
  //
  RxList express = RxList(); //express
  //
  RxList historiques = RxList(); //historiques
  //
  getStandards(bool v) async {
    Response rep = await demandeurConnexion.getStandards(v);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      standards.value = jsonDecode(rep.bodyString!);
      load.value = true;
      //print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  getExpress(bool v) async {
    Response rep = await demandeurConnexion.getExpress(v);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      express.value = jsonDecode(rep.bodyString!);
      load.value = true;
      //print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  getHistoriques(bool v) async {
    Response rep = await demandeurConnexion.getHistoriques(v);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      historiques.value = jsonDecode(rep.bodyString!);
      load.value = true;
      //print(rep.bodyString!);
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

class EncoursConnexion extends GetConnect {
  Future<Response> enregistreAgent(Map<String, dynamic> p) async => await get(
        "${Utils.url}/commande/save",
      );

  Future<Response> getStandards(bool valeur) async => await get(
        "${Utils.url}/commande/standards/$valeur",
      );
  Future<Response> getExpress(bool valeur) async => await get(
        "${Utils.url}/commande/express/$valeur",
      );
  Future<Response> getHistoriques(bool valeur) async => await get(
        "${Utils.url}/commande/allstarter/$valeur",
      );

  Future<Response> updateDemandeur(Map<dynamic, dynamic> up) async => await put(
        "${Utils.url}/client/update",
        jsonEncode(up),
      );
}
