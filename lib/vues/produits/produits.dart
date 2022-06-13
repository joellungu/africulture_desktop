import 'package:africulture_desktop/vues/produits/creation/creation_produit.dart';
import 'package:africulture_desktop/vues/produits/listage/listage.dart';
import 'package:flutter/material.dart';

class Produits extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Produits();
  }
}

class _Produits extends State<Produits> with TickerProviderStateMixin {
  List angles = ["Nouvelles produit", "Liste de produits"];
  late TabController controller;

  @override
  void initState() {
    //
    controller = TabController(length: angles.length, vsync: this);
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
          child: TabBar(
            isScrollable: true,
            controller: controller,
            indicatorWeight: 1,
            //indicator: BoxDecoration(),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            tabs: List.generate(angles.length, (index) {
              return Tab(
                text: angles[index],
              );
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: TabBarView(
            controller: controller,
            children: [
              CreationProduit(),
              ListageProduit(),
            ],
          ),
        )
      ],
    );
  }
}
