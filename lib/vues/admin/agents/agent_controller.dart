import 'dart:convert';
import 'package:africulture_desktop/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentController extends GetxController {
  AgentConnexion agentConnexion = AgentConnexion();
  //final box = GetStorage();

  enregistreAgent(Map<String, dynamic> p) async {
    //idproduit;image
    Response rep = await agentConnexion.enregistreAgent(p);
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
          "ERREUR", "Erreur d'ajout code: ${rep.statusCode}\nM: ${rep.body}",
          backgroundColor: Colors.red.shade700);
    }
  }

  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList agents = RxList();

  allAgents() async {
    load.value = false;
    details = RxMap();
    Response rep = await agentConnexion.allAgent();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      agents.value = jsonDecode(rep.bodyString!);
      load.value = true;
      print("cool");
    } else {
      load.value = false;
    }
  }
}

class AgentConnexion extends GetConnect {
  Future<Response> enregistreAgent(Map<String, dynamic> p) async => await post(
        "${Utils.url}/agent/save",
        jsonEncode(p),
      );

  Future<Response> allAgent() async => await get(
        "${Utils.url}/agent/all",
      );
}
