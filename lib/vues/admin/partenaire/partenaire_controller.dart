import 'dart:convert';
import 'package:africulture_desktop/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartenaireController extends GetxController {
  PartenaireConnexion partenaireConnexion = PartenaireConnexion();
  //final box = GetStorage();

  enregistrePartenaire(Map<String, dynamic> p) async {
    //idproduit;image
    Response rep = await partenaireConnexion.enregistrePartenaire(p);
    if (rep.statusCode == 201 || rep.statusCode == 200) {
      //
      print("${rep.body}");
      //box.write("produit", rep.body);
      Get.back();
      Get.snackbar("SUCCESS", "Enregistrement effectué avec succes",
          backgroundColor: Colors.blueGrey.shade300);
    } else {
      //
      print("${rep.statusCode}");
      //
      print("${rep.body}");
      //
      Get.back();
      Get.snackbar(
          "Etape 2", "Erreur d'ajout code: ${rep.statusCode}\nM: ${rep.body}",
          backgroundColor: Colors.red.shade700);
    }
  }

  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList partenaires = RxList();

  allPartenaires() async {
    load.value = false;
    details = RxMap();
    Response rep = await partenaireConnexion.allPartenaire();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      partenaires.value = jsonDecode(rep.bodyString!);
      load.value = true;
    } else {
      load.value = false;
    }
  }
}

class PartenaireConnexion extends GetConnect {
  Future<Response> enregistrePartenaire(Map<String, dynamic> p) async {
    print(jsonEncode(p));
    return await post("${Utils.url}/partenaire/save", jsonEncode(p),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
  }

  Future<Response> allPartenaire() async => await get(
        "${Utils.url}/partenaire/all",
      );
}
