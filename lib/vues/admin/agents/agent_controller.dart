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
    if (rep.isOk) {
      //
      print("${rep.body}");
      //box.write("produit", rep.body);
      Get.back();
      Get.snackbar(
        "Réponse du serveur",
        "${rep.body}",
        backgroundColor: Colors.blueGrey.shade300,
        duration: Duration(seconds: 5),
      );
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

  Future<Map<String, dynamic>> getAgent(String id) async {
    load.value = false;
    details = RxMap();
    Response rep = await agentConnexion.getAgent(id);
    if (rep.isOk) {
      //agents.value = jsonDecode(rep.bodyString!);
      //load.value = true;
      print(rep.body);
      return rep.body;
    } else {
      return {};
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
  Future<Response> getAgent(String id) async => await get(
        "${Utils.url}/agent/$id",
      );
}
