import 'package:flutter/material.dart';

class DetailsComp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailsComp();
  }
}

class _DetailsComp extends State<DetailsComp> with TickerProviderStateMixin {
  List angles = ["Details", "Statistiques"];
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
              Container(),
              Container(),
            ],
          ),
        )
      ],
    );
  }
}
