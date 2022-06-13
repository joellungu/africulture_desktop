import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'agence_controller.dart';

class NouvelleAgences extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NouvelleAgences();
  }
}

class _NouvelleAgences extends State<NouvelleAgences> {
  //
  AgenceController agenceController = Get.find();
  //
  var formKey = GlobalKey<FormState>();
  //TextEditingController titreMar = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController callCenter = TextEditingController();
  Map<String, Object> couverture = {};
  RxBool express = false.obs;
  String path = "";
  //
  late Widget vue;

  //
  List<Map<String, dynamic>> payss = [
    {
      'nom': 'RDC',
      'code': '+243',
    },
    {
      'nom': 'FR',
      'code': '+33',
    },
    {
      'nom': 'CH',
      'code': '+55',
    },
    {
      'nom': 'USA',
      'code': '+1',
    },
    {
      'nom': 'CDA',
      'code': '+1',
    },
  ];
  //
  RxList listePays = [].obs;
  //
  Map<String, dynamic> pays = {};
  //
  //CreationController creationController = Get.find();

  @override
  void initState() {
    //
    vue = Container();
    //
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: 400,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Nom', labelText: 'Nom'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez saisir le Nom';
                        }

                        return null;
                      },
                      controller: nom,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Adresse',
                        labelText: 'Adresse',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Entrez l'adresse";
                        }

                        return null;
                      },
                      controller: adresse,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Entrez l'email";
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
                          hintText: 'Call center', labelText: 'Call center'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ce champ est obligatoire';
                        }
                        return null;
                      },
                      controller: callCenter,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Express"),
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => CheckboxListTile(
                              onChanged: (e) {
                                print(e! ? "OUI" : "NON");
                                express.value = e;
                              },
                              value: express.value,
                              title: Text(express.value ? "OUI" : "NON"),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PopupMenuButton(
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.black,
                      ),
                      onSelected: (x) {
                        Map e = x as Map;
                        //
                        setState(() {
                          listePays.value.add(
                            {"nom": "${x['nom']}", "code": "${x['code']}"},
                          );
                          //
                          print(listePays);
                        });
                      },
                      itemBuilder: (context) => List.generate(
                        payss.length,
                        (index) => PopupMenuItem(
                          child: Text("${payss[index]['nom']}"),
                          value: payss[index],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: Obx(
                        () => ListView(
                          controller: ScrollController(),
                          children: List.generate(
                            listePays.length,
                            (index) => Card(
                                elevation: 0,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        listePays.removeAt(index);
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${listePays[index]['nom']} ${listePays[index]['code']}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        //

                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png'],
                        );
                        setState(() {
                          path = result!.files.single.path!;
                          vue = Image.file(
                            File("${result.files.single.path}"),
                            fit: BoxFit.contain,
                          );
                        });
                        //*/
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        child: path == "" ? const Icon(Icons.photo) : vue,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
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
                          Map<String, dynamic> p = {
                            "nom": nom.text,
                            "adresse": adresse.text,
                            "email": email.text,
                            "callCenter": callCenter.text,
                            "couverture": {"couverture": listePays},
                            "express": express.value
                          };
                          agenceController.enregistreProduit(p, path);
                        }
                      },
                      child: const Text("Enregistrer"),
                    ),
                    const Text("")
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
