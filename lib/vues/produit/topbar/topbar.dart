import 'dart:convert';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:africulture_desktop/vues/produit/liste_vendeur.dart';
import 'package:africulture_desktop/vues/produit/produit_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TopBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TopBar();
  }
}

class _TopBar extends State<TopBar> {
  List categories = [
    "Art",
    "Vetements",
    "Alimentaire",
    "Mobilier",
    "Décoration",
    "Autre"
  ];
  //
  var categorie = "Art";
  bool v = false;
  String aff = "1";

  Widget? vue;

  @override
  void initState() {
    //
    vue = Container();
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Checkbox(
                  value: v,
                  onChanged: (g) {
                    setState(() {
                      v = g!;
                      if (v) {
                        aff = "0";
                      } else {
                        aff = "1";
                      }
                    });
                  },
                ),
              ),
              Expanded(
                flex: 6,
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
                        vue =
                            ListageVendeur(UniqueKey(), categorie, aff, false);
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(flex: 1, child: vue!)
      ],
    );
  }
}
