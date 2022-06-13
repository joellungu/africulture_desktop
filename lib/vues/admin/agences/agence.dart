import 'package:africulture_desktop/vues/admin/agences/liste_agences.dart';
import 'package:africulture_desktop/vues/admin/agences/nouvelle_agence.dart';
import 'package:flutter/material.dart';

class Agences extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Agences();
  }
}

class _Agences extends State<Agences> with TickerProviderStateMixin {
  List angles = ["Nouvelle agence", "Les agences"];
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
              //NouvelleAgences(),
              //ListeAgents(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.yellowAccent,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
