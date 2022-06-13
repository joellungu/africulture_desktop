import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'creation_controller.dart';

class Partie1 extends StatelessWidget {
  //
  var formKey = GlobalKey<FormState>();
  TextEditingController titreMar = TextEditingController();
  TextEditingController deviseMar = TextEditingController();
  TextEditingController prixMar = TextEditingController();
  TextEditingController poidsUnitaire = TextEditingController();
  TextEditingController stockMar = TextEditingController();
  TextEditingController likeMar = TextEditingController();
  TextEditingController descriptionMar = TextEditingController();
  TextEditingController infosSupplementaireMar = TextEditingController();
  TextEditingController categorieMar = TextEditingController();
  TextEditingController posterparMar = TextEditingController(); //volume
  TextEditingController longueur = TextEditingController();
  TextEditingController largeur = TextEditingController();
  TextEditingController profondeur = TextEditingController();

  //
  List titres = [];
  //
  PageController? pageController;
  Partie1(this.pageController, this.titres);
  //
  CreationController creationController = Get.find();
  //
  double conte = 0;
  //
  @override
  Widget build(BuildContext context) {
    conte = 400 / 3;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        //width: 400,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Titre', labelText: 'Titre'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez saisir le titre';
                    }

                    return null;
                  },
                  controller: titreMar,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Prix en Dollar',
                    labelText: 'Prix en Dollar',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Entrez le prix';
                    }

                    return null;
                  },
                  controller: prixMar,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: stockMar,
                  decoration: const InputDecoration(
                    hintText: 'Stock',
                    labelText: 'Stock',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Entrez votre Stock initial';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    //print("Password value $value");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Poid unitaire en Mg',
                      labelText: 'Poid unitaire en Mg'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                  controller: poidsUnitaire,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Longueur en Cm', labelText: 'Longueur en Cm'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                  controller: longueur,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Largeur en Cm', labelText: 'Largeur en Cm'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                  controller: largeur,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Profondeur en Cm',
                      labelText: 'Profondeur en Cm'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                  controller: profondeur,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                      hintText: 'Description', labelText: 'Description'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                  controller: descriptionMar,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Infos supplementaire',
                    labelText: 'Infos supplementaire',
                  ),
                  controller: infosSupplementaireMar,
                ),
                const SizedBox(
                  height: 20,
                ),
                /*
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: categorie,
                        items: List.generate(categories.length, (index) {
                          return DropdownMenuItem(
                            value: "${categories[index]}",
                            child: Text("${categories[index]}"),
                          );
                        }),
                        onChanged: (e) {
                          setState(() {
                            categorie = e!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    */

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //
                      //print("Avant: ${titreMar?.text}");
                      creationController.titreMar.value = titreMar.text;
                      creationController.prixMar.value = prixMar.text;
                      creationController.stockMar.value = stockMar.text;
                      creationController.descriptionMar.value =
                          descriptionMar.text;
                      creationController.infosSupplementaireMar.value =
                          infosSupplementaireMar.text;
                      creationController.poidsUnitaire.value =
                          poidsUnitaire.text;
                      //i++;
                      creationController.longueur.value = longueur.text;
                      creationController.largeur.value = largeur.text;
                      creationController.profondeur.value = profondeur.text;
                      //codePays
                      //print("Après: $i");
                      creationController.avancement.value =
                          creationController.avancement.value + conte;
                      creationController.titre.value = titres[1];
                      pageController!.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: const Text("Suivant"),
                ),
                const Text("")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

*/