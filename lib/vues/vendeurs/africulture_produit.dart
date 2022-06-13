import 'package:flutter/material.dart';

import 'liste_vendeur.dart';

class AfricultureProduit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AfricultureProduit();
  }
}

class _AfricultureProduit extends State<AfricultureProduit> {
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
                  vue = ListageVendeur(categorie);
                });
              },
            ),
          ),
        ),
        Expanded(flex: 1, child: vue!)
      ],
    );
  }
}
//categorie_admin