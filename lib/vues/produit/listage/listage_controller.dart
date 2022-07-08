import 'dart:convert';

import 'package:africulture_desktop/vues/produit/listage/listage_connexion.dart';
import 'package:get/get.dart';

import 'listage.dart';

class ListageController extends GetxController {
  ListageConnexion listageConnexion = ListageConnexion();
  //
  RxList<String> listeClient = RxList();
  /*
    { 
    "nom":"",
    "adresse":"",
    "centreAppel":"",
    "email":"",
    "statut":"",
    "type":"",
    "taille":1,
    "rccm":"",
    "suspendre":false,
    }
  */
  //
  load() async {
    listeClient.clear();
    listeClient.add("AFRICULTURE");
    //Response r = await listageConnexion.load();
    //if (r.statusCode == 200 || r.statusCode == 201) {
    //  listeClient.value = jsonDecode(r.bodyString!);
    //  print(listeClient.value);
    //}
    /*
    listeClient.add({
      "nom": "AFRICULTURE",
      "adresse": "",
      "centreAppel": "",
      "email": "",
      "statut": "",
      "type": "",
      "taille": 1,
      "rccm": "",
      "suspendre": false,
    });
    */
  }
}
