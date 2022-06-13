import 'dart:io';
import 'package:africulture_desktop/vues/produits/creation/partie2.dart';
import 'package:africulture_desktop/vues/produits/creation/partie3.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'creation_controller.dart';
import 'partie1.dart';

//
List<PlatformFile> listeImage = [];

class CreationProduit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreationProduit();
  }
}

class _CreationProduit extends State<CreationProduit> {
  PageController pageController = PageController();

  //CommanderController commanderController = Get.find();
  //RxDouble avancement = 0.0.obs;
  //RxString titre = "Infos produit".obs;
  //
  //PanierController panierController = Get.find();
  CreationController creationController = Get.find();
  //
  double conte = 0;
  int i = 0;
  List<String> titres = ["Adresse", "Expédition", "Commandes"];

  @override
  Widget build(BuildContext context) {
    conte = 400 / 3;
    creationController.avancement.value = conte;
    //
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 5,
                        color: Colors.black,
                        width: creationController.avancement.value,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: PageView(
                    controller: pageController,
                    children: [
                      Partie1(pageController, titres),
                      Partie2(pageController, titres),
                      Partie3(),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  /*
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (i > 0) {
                            print("Avant: $i");
                            i--;
                            print("Après: $i");
                            creationController.avancement.value =
                                creationController.avancement.value - conte;
                            creationController.titre.value = titres[i];
                            pageController.previousPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: const Text("Retour"),
                      ),
                      TextButton(
                        onPressed: () {
                          if (creationController.formKey.currentState!
                              .validate()) {
                            if (i <= 2) {
                              print(
                                  "Avant: ${creationController.titreMar?.text}");
                              i++;
                              //print("Après: $i");
                              creationController.avancement.value =
                                  creationController.avancement.value + conte;
                              creationController.titre.value = titres[i];
                              pageController.nextPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          }
                          //
                        },
                        child: const Text("Suivant"),
                      ),
                    ],
                  ),
                  */
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChampImage extends StatefulWidget {
  String? image;
  int? index;
  State state;
  ChampImage(this.image, this.index, this.state);
  @override
  State<StatefulWidget> createState() {
    return _ChampImage();
  }
}

class _ChampImage extends State<ChampImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              //color: Colors.blue,
              child: Image.file(
                File("${widget.image}"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              //color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  widget.state.setState(() {
                    listeImage.removeAt(widget.index!);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
