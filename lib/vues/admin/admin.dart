import 'package:africulture_desktop/vues/admin/agences/agence.dart';
import 'package:africulture_desktop/vues/admin/agents/liste_agents.dart';
import 'package:africulture_desktop/vues/admin/agents/nouvelle_agent.dart';
import 'package:africulture_desktop/vues/admin/boutiques/boutique.dart';
import 'package:africulture_desktop/vues/admin/partenaire/liste_partenaire.dart';
import 'package:africulture_desktop/vues/admin/partenaire/nouveau_partenaire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  RxList<bool> choix =
      [true, false, false, false, false, false, false, false, false].obs;
  //
  RxInt vue = 0.obs;

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
          child: Obx(
            () => ToggleButtons(
              children: List.generate(
                  angles.length, ((index) => Text(" ${angles[index]} "))),
              onPressed: (int index) {
                for (int btnIndex = 0; btnIndex < choix.length; btnIndex++) {
                  if (btnIndex == index) {
                    choix[btnIndex] = true;
                    vue.value = index;
                  } else {
                    choix[btnIndex] = false;
                  }
                }
              },
              borderRadius: BorderRadius.circular(10),
              isSelected: choix.value,
            ),
          ),
          /*
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
          */
        ),
        Expanded(
          flex: 1,
          child: Obx(
            () => Container(
              child: vue.value == 0
                  ? NouvelleAgents()
                  : vue.value == 1
                      ? ListageAgent()
                      : vue.value == 2
                          ? NouveauPartenaire()
                          : vue.value == 3
                              ? ListagePartenaire()
                              : vue.value == 4
                                  ? Boutiques()
                                  : vue.value == 5
                                      ? Agences()
                                      : vue.value == 6
                                          ? Container()
                                          : vue.value == 7
                                              ? Container()
                                              : Container(),
            ),
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
