import 'dart:async';
import 'dart:convert';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:get/get.dart';

class VendeurController extends GetxController with StateMixin<List> {
  //
  VendeurConnexion vendeurConnexion = VendeurConnexion();
  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList produits = RxList();
  RxList images = RxList();

  getParCategorieForAdmin(String categorie) async {
    //print(categorie);
    //load.value = false;
    details = RxMap();
    Response rep = await vendeurConnexion.getParCategorieForAdmin(categorie);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //print(rep.bodyString!);
      produits.value = jsonDecode(rep.bodyString!);
      print(produits.value);
      //load.value = true;
      change(produits.value, status: RxStatus.success());
    } else {
      //load.value = false;
      change([], status: RxStatus.success());
    }
  }

  getListeImages(String idproduit) async {
    print("Le id du produit vaut: $idproduit");
    Response rep = await vendeurConnexion.getListeImages(idproduit);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.bodyString!);
      images.value = jsonDecode(rep.bodyString!);
      //load.value = true;
      print("cool ${images.value}");
    } else {
      //load.value = false;
      print("pas cool");
    }
  }
}

class VendeurConnexion extends GetConnect {
  Future<Response> getParCategorieForAdmin(String categorie) async => await get(
        "${Utils.url}/produit/categorie_admin/$categorie",
      );
  //
  Future<Response> getListeImages(String categorie) async => await get(
        "${Utils.url}/produit/liste_images/$categorie",
      );
}
