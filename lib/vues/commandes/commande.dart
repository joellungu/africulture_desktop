import 'package:africulture_desktop/vues/commandes/encours/encours.dart';
import 'package:africulture_desktop/vues/commandes/traite/traite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Commandes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Commandes();
  }
}

class _Commandes extends State<Commandes> with TickerProviderStateMixin {
  List angles = ["Nouvelles commandes en cours", "Commandes traité"];
  //
  RxList<bool> choix = [true, false].obs;
  //
  RxInt vue = 0.obs;
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
            () => Container(child: vue.value == 0 ? Encours() : Traite()),
          ),
        )
      ],
    );
  }
}
