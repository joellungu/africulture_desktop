import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'creation_controller.dart';

List<PlatformFile> listeImage = [];

class Partie3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Partie3();
  }
}

class _Partie3 extends State<Partie3> {
  //
  CreationController creationController = Get.find();
  //

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 20,
          ),
          width: 300,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    Column(
                      children: List.generate(listeImage.length, (index) {
                        return ChampImage(listeImage[index].path, index, this);
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        //

                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png'],
                        );
                        setState(() {
                          listeImage.add(result!.files.single);
                        });
                        //*/
                      },
                      child: const Text("Ajouter"),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (listeImage.isNotEmpty) {
                    CreationController creationController = Get.find();
                    //
                    final box = GetStorage();
                    //
                    Get.dialog(
                      const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      name: "Attente...",
                    );
                    //
                    int tt = 0;
                    //final box = GetStorage();
                    //Map<String, dynamic> imap = box.read('produit');
                    //print("La valeur: $imap");

                    //

                    Map<String, dynamic> m = {
                      "idfournisseur": "0",
                      "titreMar": creationController.titreMar.value,
                      "deviseMar": "\$",
                      "prixMar": creationController.prixMar.value,
                      "poidsUnitaire": creationController.poidsUnitaire.value,
                      "stockMar": creationController.stockMar.value,
                      "uniteP": creationController.uniteP.value,
                      "likeMar": 0,
                      "descriptionMar": creationController.descriptionMar.value,
                      "infosSupplementaireMar":
                          creationController.infosSupplementaireMar.value,
                      "categorieMar": creationController.categorieMar.value,
                      "posterparMar": 1,
                      //"tailleUtilite": creationController.tailleUtilite.value,
                      "datePosterMar": "${DateTime.now()}",
                      "filtreMar": "",
                      "statutMar": true,
                      "promotion": false,
                      "prixRabes": 0.0,
                      "nombreImages": listeImage.length,
                      "nomBoutique": "AfricCulture",
                      "topbar": false, //,
                      "longueur": creationController.longueur.value,
                      "largeur": creationController.largeur.value,
                      "profondeur": creationController.profondeur.value,
                      "paysOrigine": "RDC",
                      "codePays": "+243",
                    };
                    //
                    int r = await creationController.enregistrerProduit(m);
                    //
                    //Map<String, dynamic> r = box.read("produit");
                    print("______________: $r");
                    //
                    bool v = false;
                    //
                    if (r != 0) {
                      List<Map<String, dynamic>> li = [];
                      List.generate(listeImage.length, (index) async {
                        //
                        li.add({
                          'idproduit': r,
                          'nomImage': 'img$index',
                          'image':
                              File(listeImage[index].path!).readAsBytesSync()
                        });
                        /*
                      v = await creationController.enregistrerImageProduit({
                        'idproduit': r,
                        'nomImage': 'img$index',
                        'image': File(listeImage[index].path!).readAsBytesSync()
                      });
                      */
                      });
                      v = await creationController.enregistrerImageProduit(li);
                      print("La valeur sans condition vaut: $v");
                      if (v) {
                        print("La valeur dans le condition vaut: $v");
                        Get.back();
                        Get.showSnackbar(
                          GetSnackBar(
                            title: "SUCCESS",
                            message: "Enregistrement effectué",
                            duration: Duration(
                              seconds: 5,
                            ),
                          ),
                        );
                      } else {
                        print("La pas cool valeur dans le condition vaut: $v");
                      }
                    } else {
                      Get.back();
                      Get.showSnackbar(
                        GetSnackBar(
                          title: "Erreur",
                          message: "Un problème lors de l'enregistrement",
                          duration: Duration(
                            seconds: 5,
                          ),
                        ),
                      );
                    }
                    setState(() {});
                  } else {
                    //Get.back();
                    Get.showSnackbar(
                      GetSnackBar(
                        title: "Pas d'image",
                        message: "Veuillez associer au moin un photo",
                        duration: Duration(
                          seconds: 5,
                        ),
                      ),
                    );
                  }
                },
                child: Text("Envoyer"),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
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
