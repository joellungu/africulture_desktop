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
  RxList listProduitDansPanier = RxList();
  //
  getStandards(bool v) async {
    Response rep = await demandeurConnexion.getStandards(v);
    if (rep.isOk) {
      standards.value = jsonDecode(rep.bodyString!);
      load.value = true;
      //print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  getExpress(bool v) async {
    Response rep = await demandeurConnexion.getExpress(v);
    if (rep.isOk) {
      express.value = jsonDecode(rep.bodyString!);
      load.value = true;
      //print(rep.bodyString!);
    } else {
      load.value = false;
    }
  }

  getHistoriques(bool v) async {
    Response rep = await demandeurConnexion.getHistoriques(v);
    if (rep.isOk) {
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
    if (rep.isOk) {
      details.value = {}; //jsonDecode(rep.bodyString!);
      load.value = false;
      details.value = {}; //1
      //allAcceptes(); //2
      print("cool");
    } else {
      load.value = false;
    }
  }

  //
  vendeurcommandePanierProduit(String code) async {
    Response rep = await demandeurConnexion.vendeurcommandePanierProduit(code);

    print("La liste des produit: ${rep.body}");
    if (rep.isOk) {
      //
      listProduitDansPanier.value = rep.body;
    } else {
      //
      listProduitDansPanier.value = [];
    }
  }
  //
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
  //
  Future<Response> vendeurcommandePanierProduit(String code) async {
    print("${Utils.url}/vendeurcommande/all/$code");
    return post("${Utils.url}/vendeurcommande/all", code,
        headers: {"Content-Type": "text/plain"});
  }
}
