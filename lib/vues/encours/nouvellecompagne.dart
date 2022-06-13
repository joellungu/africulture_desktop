import 'package:flutter/material.dart';

class NouvelleCompagne extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  //LoginController loginController = Get.find();
  /*
  String libelle;
    String description;
    byte[] idimage;
    Long idauteur;
    String auteur;
    LocalDate datedebut;
    LocalDate datefin;
    int maxporte;
    int total;
  */
  //
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          //height: 600,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Nouvelle compagne"),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez saisir votre email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "exemple: exemple@gmail.com",
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez saisir votre mot de passe';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "exemple: xyz123@",
                                labelText: 'Mot de passe',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez saisir votre email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "exemple: exemple@gmail.com",
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez saisir votre mot de passe';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "exemple: xyz123@",
                                labelText: 'Mot de passe',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez saisir votre email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "exemple: exemple@gmail.com",
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez saisir votre mot de passe';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "exemple: xyz123@",
                                labelText: 'Mot de passe',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    //enCoursController.detStat.value = false;
                  },
                  child: const Text("Créer"),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        )
      ],
    );
  }
}
