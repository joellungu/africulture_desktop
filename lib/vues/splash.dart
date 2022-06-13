import 'dart:async';
import 'package:africulture_desktop/vues/admin/boutiques/accepter/accepter_controller.dart';
import 'package:africulture_desktop/vues/admin/boutiques/accepter/details/details_boutique_controller.dart';
import 'package:africulture_desktop/vues/admin/boutiques/demandeurs/demandeur_controller.dart';
import 'package:africulture_desktop/vues/admin/boutiques/suspendus/suspendus_controller.dart';
import 'package:africulture_desktop/vues/admin/partenaire/partenaire_controller.dart';
import 'package:africulture_desktop/vues/commandes/encours/encours_controller.dart';
import 'package:africulture_desktop/vues/commandes/traite/traite_controller.dart';
import 'package:africulture_desktop/vues/produits/listage/listage_controller.dart';
import 'package:africulture_desktop/vues/produits/produits_controller.dart';
import 'package:africulture_desktop/vues/vendeurs/vendeur_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'admin/agences/agence_controller.dart';
import 'principal.dart';
import 'produits/creation/creation_controller.dart';

class Splash extends StatelessWidget {
  //
  ProduitController produitController = Get.put(ProduitController());
  CreationController creationController = Get.put(CreationController());
  ListageController listageController = Get.put(ListageController());
  PartenaireController partenaireController = Get.put(PartenaireController());
  //
  SuspendusController suspendusController = Get.put(SuspendusController());
  DemandeurController demandeurController = Get.put(DemandeurController());
  AccepterController accepterController = Get.put(AccepterController());
  VendeurController vendeurController = Get.put(VendeurController());
  AgenceController agenceController = Get.put(AgenceController()); //
  EncoursController encoursController = Get.put(EncoursController());
  TraiteController traiteController = Get.put(TraiteController());
  //
  DetailsBoutiqueController detailsBoutiqueController =
      Get.put(DetailsBoutiqueController());

  Splash() {
    Timer(const Duration(seconds: 3), () {
      Get.off(Principal());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("AFRICULTURE"),
      ),
    );
  }
}
