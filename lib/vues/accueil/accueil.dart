import 'dart:io';

import 'package:africulture_desktop/vues/accueil/accueilController.dart';
import 'package:africulture_desktop/vues/admin/admin.dart';
import 'package:africulture_desktop/vues/commandes/commande.dart';
import 'package:africulture_desktop/vues/produits/produits.dart';
import 'package:africulture_desktop/vues/vendeurs/vendeurs.dart';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Accueil();
  }
}

class _Accueil extends State<Accueil> {
  //
  AccueilController accueilController = Get.find();
  //
  String titre = "AfriCulture";
  //
  Widget vue = Container();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          children: [
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Container(),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: const Text.rich(
                      TextSpan(
                        text: "AfriCulture\n",
                        children: [
                          TextSpan(
                            text: "example@gmail.com",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      titre = "Commandes";
                      vue = Commandes();
                      Navigator.of(context).pop();
                    });
                  },
                  leading: Icon(Icons.card_giftcard_outlined),
                  title: Text(
                    "Commandes",
                  ),
                  trailing: Card(
                    //alignment: Alignment.center,
                    //color: Colors.red.shade700,
                    //width: 100,
                    child: Text(
                      "12",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    //
                    //var client = NotificationsClient();
                    //await client.notify('Hello World!');
                    //await client.close();
                    //
                    setState(() {
                      titre = "Nos produits";
                      vue = Vendeur();
                      Navigator.of(context).pop();
                    });
                  },
                  leading: const Icon(Icons.add_business),
                  title: const Text(
                    "Nos produits",
                  ),
                  trailing: const Card(
                    //alignment: Alignment.center,
                    //color: Colors.red.shade700,
                    //width: 100,
                    child: Text(
                      "120",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      titre = "Utilisateurs";
                      vue = Container(
                        color: Colors.green,
                      );
                      Navigator.of(context).pop();
                    });
                  },
                  leading: Icon(Icons.people_alt_outlined),
                  title: Text(
                    "Utilisateurs",
                  ),
                  trailing: Card(
                    //alignment: Alignment.center,
                    //color: Colors.red.shade700,
                    //width: 100,
                    child: Text(
                      "120000",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                /*
                ListTile(
                  onTap: () {
                    setState(() {
                      titre = "Produits";
                      vue = Produits();
                      Navigator.of(context).pop();
                    });
                  },
                  leading: Icon(Icons.open_in_browser),
                  title: Text(
                    "Produits",
                  ),
                  //trailing: const Icon(Icons.arrow_forward_ios),
                ),
                */
                ListTile(
                  onTap: () {
                    setState(() {
                      titre = "Utilisateurs";
                      vue = Container(
                        color: Colors.green,
                      );
                      Navigator.of(context).pop();
                    });
                  },
                  leading: Icon(Icons.analytics),
                  title: Text(
                    "Stats",
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      titre = "Admin";
                      vue = Admin();
                      Navigator.of(context).pop();
                    });
                  },
                  leading: Icon(Icons.admin_panel_settings),
                  title: Text(
                    "Admin",
                  ),
                  //trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.close),
                  title: Text(
                    "Quitter",
                  ),
                  //trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(titre),
        backgroundColor: Colors.black,
        /*
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.yellow.shade700,
                Colors.black,
              ],
            ),
          ),
        ),
        */
      ),
      body: vue,
    );
  }
}
