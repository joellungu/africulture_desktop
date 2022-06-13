import 'package:africulture_desktop/vues/admin/boutiques/accepter/liste_accepter.dart';
import 'package:africulture_desktop/vues/admin/boutiques/demandeurs/liste_demandeur.dart';
import 'package:africulture_desktop/vues/admin/boutiques/suspendus/liste_suspendu.dart';
import 'package:flutter/material.dart';

class Boutiques extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Boutiques();
  }
}

class _Boutiques extends State<Boutiques> with TickerProviderStateMixin {
  List angles = ["Démandeurs", "Accepter", "Bloqué"];
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
              ListagePartenaire(),
              ListageAccepter(),
              ListageSuspendu()
            ],
          ),
        )
      ],
    );
  }
}
