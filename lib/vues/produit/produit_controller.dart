import 'dart:async';
import 'dart:convert';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:get/get.dart';

class ProduitController extends GetxController with StateMixin<List> {
  //
  ProduitConnexion produitConnexion = ProduitConnexion();
  //
  RxBool load = false.obs;
  //
  RxMap details = RxMap();
  //
  RxList produits = RxList();
  //
  RxList produitsNonValide = RxList();
  //
  RxList images = RxList();

  getParCategorieForAdmin(String categorie, String aff) async {
    print(categorie + "$aff");
    //load.value = false;
    details = RxMap();
    Response rep =
        await produitConnexion.getParCategorieForAdmin(categorie, "0");
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

  produitNonValider(String categorie, bool statut) async {
    //print(categorie + "$aff");
    //load.value = false;
    details = RxMap();
    Response rep = await produitConnexion.produitnonvalider(categorie, statut);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.statusCode!);
      produitsNonValide.value = jsonDecode(rep.bodyString!);
      print(produitsNonValide.value);
      //load.value = true;
      change(produitsNonValide.value, status: RxStatus.success());
    } else {
      print(rep.statusCode!);
      //load.value = false;
      change([], status: RxStatus.success());
    }
  }

  getAllFavorit() {}

  updateProduit(Map<dynamic, dynamic> p, bool v) async {
    Response rep = await produitConnexion.updateProduit(p);
    if (rep.isOk) {
      //load.value = true;
      Get.back();
      Get.snackbar("SUCCES", "Mise à jour éffectué");
      produitNonValider(p['categorieMar'], v);
    } else {
      Get.back();
      Get.snackbar("ERREUR",
          "Mise à jour non éffectué code d'erreur: ${rep.statusCode}");
      //load.value = false;
    }
  }

  getListeImages(String idproduit) async {
    print("Le id du produit vaut: $idproduit");
    Response rep = await produitConnexion.getListeImages(idproduit);
    if (rep.isOk) {
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

class ProduitConnexion extends GetConnect {
  Future<Response> getParCategorieForAdmin(
          String categorie, String aff) async =>
      await get(
        "${Utils.url}/produit/categorie_admin/$categorie/$aff",
      );
  //
  Future<Response> getAllFavorit() async => await get(
        "${Utils.url}/produit/categorie_admin",
      );
  //
  Future<Response> getListeImages(String categorie) async => await get(
        "${Utils.url}/produit/liste_images/$categorie",
      );
  //
  Future<Response> updateProduit(Map<dynamic, dynamic> p) async =>
      await put("${Utils.url}/produit/update", jsonEncode(p));
  //
  Future<Response> produitnonvalider(String categorie, bool statut) async =>
      await get(
        "${Utils.url}/produit/produitnonvalider/$categorie/$statut",
      );
}
