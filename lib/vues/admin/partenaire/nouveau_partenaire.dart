import 'package:africulture_desktop/vues/admin/partenaire/partenaire_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NouveauPartenaire extends GetView<PartenaireController> {
  final _formKey = GlobalKey<FormState>();
  //
  final nom = TextEditingController();
  final postnom = TextEditingController();
  final prenom = TextEditingController();
  final email = TextEditingController();
  final numero = TextEditingController();
  final adresse = TextEditingController();
  //var role = TextEditingController();
  List sexes = ["M", "F"];
  var sexe = "M";
  List etatCivils = ["M", "C", "D"];
  var etatCivil = "M";
  var dateNaissance = DateTime.now();
  List nationalites = ["Congolaise", "Autre"];
  var nationalite = "Congolaise";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: 400,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Nom', labelText: 'Nom'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez saisir le nom';
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
                      hintText: 'Postnom',
                      labelText: 'Postnom',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrez le postnom';
                      }
                      return null;
                    },
                    controller: postnom,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: prenom,
                    decoration: const InputDecoration(
                      hintText: 'Prenom',
                      labelText: 'Prenom',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrez le prenom';
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
                        hintText: 'Email', labelText: 'Email'),
                    validator: (value) {
                      return null;
                    },
                    controller: email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Numero', labelText: 'Numero'),
                    validator: (value) {
                      return null;
                    },
                    controller: numero,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Adresse', labelText: 'Adresse'),
                    validator: (value) {
                      return null;
                    },
                    controller: adresse,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sexe    "),
                      Expanded(
                        flex: 1,
                        child: StatefulBuilder(builder: (context, setState) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: sexe,
                              items: List.generate(sexes.length, (index) {
                                return DropdownMenuItem(
                                  value: "${sexes[index]}",
                                  child: Text("${sexes[index]}"),
                                );
                              }),
                              onChanged: (e) {
                                setState(() {
                                  sexe = e!;
                                });
                              },
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Etat Civils    "),
                      Expanded(
                        flex: 1,
                        child: StatefulBuilder(builder: (context, setState) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: etatCivil,
                              items: List.generate(etatCivils.length, (index) {
                                return DropdownMenuItem(
                                  value: "${etatCivils[index]}",
                                  child: Text("${etatCivils[index]}"),
                                );
                              }),
                              onChanged: (e) {
                                setState(() {
                                  etatCivil = e!;
                                });
                              },
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nationalité    "),
                      Expanded(
                        flex: 1,
                        child: StatefulBuilder(builder: (context, setState) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: nationalite,
                              items:
                                  List.generate(nationalites.length, (index) {
                                return DropdownMenuItem(
                                  value: "${nationalites[index]}",
                                  child: Text("${nationalites[index]}"),
                                );
                              }),
                              onChanged: (e) {
                                setState(() {
                                  nationalite = e!;
                                });
                              },
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /*
                        Timer(Duration(seconds: 4), () {
                          Get.snackbar("Correct", "Un simple message!");
                        });
                        */
                        //
                        //Get.off(Accueil());
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
                        //Timer(Duration(seconds: 2), () {
                        //loginController.enregistrement(
                        //  _nom.text, _numero.text, _mdp.text);
                        //
                        Map<String, dynamic> p = {
                          "nom": nom.text,
                          "postnom": postnom.text,
                          "prenom": prenom.text,
                          "email": email.text,
                          "numero": numero.text,
                          "adresse": adresse.text,
                          "sexe": sexe,
                          "etatCivil": etatCivil,
                          "dateNaissance": "$dateNaissance",
                          "nationalite": nationalite
                        };
                        controller.enregistrePartenaire(p);
                        //Get.back();
                        //splashController.seLoger(true);
                        //});
                      }
                    },
                    child: const Text("S'enregistrer"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("")
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
