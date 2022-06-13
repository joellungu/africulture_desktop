import 'package:africulture_desktop/vues/commandes/encours/encours.dart';
import 'package:africulture_desktop/vues/commandes/traite/traite.dart';
import 'package:flutter/material.dart';

class Commandes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Commandes();
  }
}

class _Commandes extends State<Commandes> with TickerProviderStateMixin {
  List angles = ["Nouvelles commandes en cours", "Commandes traité"];
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
              Encours(),
              Traite(),
            ],
          ),
        )
      ],
    );
  }
}
