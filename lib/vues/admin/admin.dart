import 'package:africulture_desktop/vues/admin/agences/agence.dart';
import 'package:africulture_desktop/vues/admin/agents/liste_agents.dart';
import 'package:africulture_desktop/vues/admin/agents/nouvelle_agent.dart';
import 'package:africulture_desktop/vues/admin/boutiques/boutique.dart';
import 'package:africulture_desktop/vues/admin/partenaire/liste_partenaire.dart';
import 'package:africulture_desktop/vues/admin/partenaire/nouveau_partenaire.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Admin();
  }
}

class _Admin extends State<Admin> with TickerProviderStateMixin {
  List angles = [
    "Nouvelle agent",
    "Liste agent",
    "Nouvelle partenaire",
    "Liste partenaire",
    "Boutiques",
    "Agences",
    "Notre politique",
    "Notifications",
    "Admin "
  ];
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
            children: List.generate(angles.length, (index) {
              if (index == 0) {
                return NouvelleAgents();
              } else if (index == 1) {
                return ListageAgent();
              } else if (index == 2) {
                return NouveauPartenaire();
              } else if (index == 3) {
                return ListagePartenaire();
              } else if (index == 4) {
                return Boutiques();
              } else if (index == 5) {
                return Agences();
              } else if (index == 6) {
                return Container();
              } else if (index == 7) {
                return Container();
              } else if (index == 8) {
                return Container();
              } else {
                return Container();
              }
            }),
          ),
        )
      ],
    );
  }

  Widget t(String t) {
    return Container(
      width: 150,
      child: Text(t),
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
    );
  }
}
