import 'package:africulture_desktop/vues/produit/creation/creation_produit.dart';
import 'package:africulture_desktop/vues/produit/topbar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'africulture_produit.dart';
import 'liste_vendeur.dart';
import 'produits_postes.dart';
import 'valider_nouveau_produit.dart';

class Produit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Produit();
  }
}

class _Produit extends State<Produit> with TickerProviderStateMixin {
  List angles = [
    "Ajouter un produit",
    "Liste de nos produits",
    "Validation des articles postés",
    "Articles validés",
    "TopBar"
  ];
  RxList<bool> choix = [true, false, false, false, false].obs;
  //
  RxInt vue = 0.obs;
  late TabController controller;

  @override
  void initState() {
    //
    controller = TabController(length: angles.length, vsync: this);
    //
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          //color: Colors.blue,
          alignment: Alignment.center,
          child: Obx(
            () => ToggleButtons(
              children: List.generate(
                  angles.length, ((index) => Text(" ${angles[index]} "))),
              onPressed: (int index) {
                for (int btnIndex = 0; btnIndex < choix.length; btnIndex++) {
                  if (btnIndex == index) {
                    choix[btnIndex] = true;
                    vue.value = index;
                  } else {
                    choix[btnIndex] = false;
                  }
                }
              },
              borderRadius: BorderRadius.circular(10),
              isSelected: choix.value,
            ),
          ),
          /*
          child: TabBar(
            isScrollable: true,
            controller: controller,
            indicatorWeight: 1,
            //indicator: BoxDecoration(),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            tabs: List.generate(angles.length, (index) {
              return Tab(
                text: angles[index],
              );
            }),
          ),
        */
        ),
        Expanded(
          flex: 1,
          child: Obx(
            () => Container(
              child: vue.value == 0
                  ? CreationProduit()
                  : vue.value == 1
                      ? AfricultureProduit()
                      : vue.value == 2
                          ? ValiderNouveauProduit()
                          : vue.value == 3
                              ? ProduitValider()
                              : TopBar(),
            ),
          ),
        )
      ],
    );
  }
}
