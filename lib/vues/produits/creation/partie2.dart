import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'creation_controller.dart';

class Partie2 extends StatefulWidget {
  //
  List titres = [];
  //
  PageController? pageController;
  Partie2(this.pageController, this.titres);
  @override
  State<StatefulWidget> createState() {
    return _Partie2();
  }
}

class _Partie2 extends State<Partie2> {
  List categories = [
    "Art",
    "Vetements",
    "Alimentaire",
    "Mobilier",
    "Décoration",
    "Autre"
  ];
  //
  var formKey = GlobalKey<FormState>();
  //
  var categorie = "Art";
  //
  TextEditingController titre = TextEditingController();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  TextEditingController p2 = TextEditingController();
  TextEditingController p3 = TextEditingController();
  TextEditingController p4 = TextEditingController();
  //
  CreationController creationController = Get.find();
  //
  RxBool d = false.obs;
  //
  double conte = 0;
  //
  @override
  Widget build(BuildContext context) {
    conte = 400 / 3;
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(children: [
          const Text("Type de profuit:    "),
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              //color: Colors.blue,
              alignment: Alignment.center,
              child: DropdownButtonHideUnderline(
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
                      creationController.categorieMar.value = e;
                      //vue = ListageVendeur(categorie);
                    });
                  },
                ),
              ),
            ),
          )
        ]),
        const SizedBox(
          height: 15,
        ),
        /*
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Obx(
            () => CheckboxListTile(
              title: const Text("Unité de messure"),
              subtitle: const Text("Ajouter des unités de mesures au produit"),
              onChanged: (c) {
                //d.value = c!;
              },
              value: d.value,
            ),
          ),
        ),
        */
        const SizedBox(
          height: 15,
        ),
        /*
        Expanded(
          flex: 1,
          child: Obx(
            () => d.value
                ? Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ListView(
                            padding: const EdgeInsets.all(5),
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Taille, Unité etc."),
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        controller: titre,
                                        decoration: InputDecoration(
                                            hintText: "Unité de mesure"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        controller: t1,
                                        decoration:
                                            InputDecoration(hintText: "Unité"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: TextFormField(
                                        controller: p1,
                                        decoration: InputDecoration(
                                            hintText: "Valeur en poids"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        controller: t2,
                                        decoration:
                                            InputDecoration(hintText: "Unité"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: TextFormField(
                                        controller: p2,
                                        decoration: InputDecoration(
                                            hintText: "Valeur en poids"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        controller: t3,
                                        decoration:
                                            InputDecoration(hintText: "Unité"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: TextFormField(
                                        controller: p3,
                                        decoration: InputDecoration(
                                            hintText: "Valeur en poids"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        controller: t4,
                                        decoration:
                                            InputDecoration(hintText: "Unité"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: TextFormField(
                                        controller: p4,
                                        decoration: InputDecoration(
                                            hintText: "Valeur en poids"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (d.value) {
                                if (formKey.currentState!.validate()) {
                                  Map p = {
                                    "titre": titre.text,
                                    "details": {
                                      "t1": {"titre": t1.text, "poid": p1.text},
                                      "t2": {"titre": t2.text, "poid": p2.text},
                                      "t3": {"titre": t3.text, "poid": p3.text},
                                      "t4": {"titre": t4.text, "poid": p4.text}
                                    }
                                  };
                                  creationController.tailleUtilite.value = p;
                                }
                              } else {
                                creationController.tailleUtilite.value = {};
                              }
                              /**/
                              creationController.avancement.value =
                                  creationController.avancement.value + conte;
                              creationController.titre.value = widget.titres[1];
                              widget.pageController!.nextPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Text("Suivant"),
                          ),
                        )
                      ],
                    ),
                  )
                : Container()
          ),
        )
        */
        Container(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (d.value) {
                if (formKey.currentState!.validate()) {
                  Map p = {
                    "titre": titre.text,
                    "details": {
                      "t1": {"titre": t1.text, "poid": p1.text},
                      "t2": {"titre": t2.text, "poid": p2.text},
                      "t3": {"titre": t3.text, "poid": p3.text},
                      "t4": {"titre": t4.text, "poid": p4.text}
                    }
                  };
                  creationController.tailleUtilite.value = p;
                }
              } else {
                creationController.tailleUtilite.value = {};
              }
              /**/
              creationController.avancement.value =
                  creationController.avancement.value + conte;
              creationController.titre.value = widget.titres[1];
              widget.pageController!.nextPage(
                duration: const Duration(microseconds: 500),
                curve: Curves.ease,
              );
            },
            child: Text("Suivant"),
          ),
        ),
      ],
    );
  }
}
