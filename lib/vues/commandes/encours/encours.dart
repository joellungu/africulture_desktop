import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'encours_controller.dart';

class Encours extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Encours();
  }
}

class _Encours extends State<Encours> with TickerProviderStateMixin {
  List angles = ["STANDARD", "EXPRESS"];
  late TabController _controller;

  EncoursController controller = Get.find();

  @override
  void initState() {
    //
    _controller = TabController(length: angles.length, vsync: this);
    //
    controller.getStandards(false);
    //
    controller.getExpress(true);
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
            controller: _controller,
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
            controller: _controller,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: Obx(
                          () => controller.load.value
                              ? ListView(
                                  controller: ScrollController(),
                                  children: List.generate(
                                    controller.standards.length,
                                    (index) => ListTile(
                                      onTap: () {
                                        controller.details.value =
                                            controller.standards[index];
                                        //print(controller.details.value);
                                        controller.l.value =
                                            controller.standards[index]
                                                ['panier']['liste'];
                                      },
                                      leading: Icon(Icons.person),
                                      title: Text(
                                          "${controller.standards[index]['nom']} \n${controller.standards[index]['date']}"),
                                      subtitle: Text(
                                          "${controller.standards[index]['pays']}"),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Obx(
                        () => Container(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          width: double.maxFinite,
                                          color: Colors.blueGrey,
                                          child: RichText(
                                            text: TextSpan(text: '', children: [
                                              const TextSpan(text: "Nom:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['nom'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "numero:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['numero'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "centreAppel:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['centreAppel'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "pays destinatio:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['pays'] ?? ''}\n"),
                                              const TextSpan(text: "code:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['code'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "expresse:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['expresse'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "expedier:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['expedier'] ?? ''}\n"),
                                            ]),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          color: Colors.blueGrey,
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                    text: "adresse:    "),
                                                controller.details['adresse'] !=
                                                        null
                                                    ? TextSpan(
                                                        text: "",
                                                        children: [
                                                            TextSpan(
                                                                text: '',
                                                                children: [
                                                                  const TextSpan(
                                                                      text:
                                                                          "commArrond:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['commArrond'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "ville:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['ville'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "numero:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['numero'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "quartier:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['quartier'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "etatProvince:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['etatProvince'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "avenue:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['avenue'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "codePostal:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['codePostal'] ?? ''}\n"),
                                                                ]),
                                                          ])
                                                    : TextSpan(),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red),
                                        ),
                                        onPressed: () {},
                                        child: Text("Notifier")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                      ),
                                      onPressed: () {},
                                      child: Text("Suspendrer"),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.green,
                                        ),
                                      ),
                                      onPressed: () {
                                        //Get.to(DetailsBoutique());
                                      },
                                      child: Text("Plus d'infos"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Obx(
                          () => ListView(
                            children:
                                List.generate(controller.l.length, (index) {
                              return ListTile(
                                title: Text("${controller.l[index]['titre']}"),
                                subtitle:
                                    Text("${controller.l[index]['prix']}"),
                              );
                            }),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: Obx(
                          () => controller.load.value
                              ? ListView(
                                  controller: ScrollController(),
                                  children: List.generate(
                                    controller.express.length,
                                    (index) => ListTile(
                                      onTap: () {
                                        controller.details.value =
                                            controller.express[index];
                                        //print(controller.details.value);
                                      },
                                      leading: Icon(Icons.person),
                                      title: Text(
                                          "${controller.express[index]['nom']} \n${controller.express[index]['email']}"),
                                      subtitle: Text(
                                          "${controller.express[index]['email']} \n ${controller.express[index]['centreAppel']}"),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Obx(
                        () => Container(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          width: double.maxFinite,
                                          color: Colors.blueGrey,
                                          child: RichText(
                                            text: TextSpan(text: '', children: [
                                              const TextSpan(text: "Nom:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['nom'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "numero:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['numero'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "centreAppel:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['centreAppel'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "pays destinatio:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['pays'] ?? ''}\n"),
                                              const TextSpan(text: "code:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['code'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "expresse:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['expresse'] ?? ''}\n"),
                                              const TextSpan(
                                                  text: "expedier:    "),
                                              TextSpan(
                                                  text:
                                                      "${controller.details['expedier'] ?? ''}\n"),
                                            ]),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          color: Colors.blueGrey,
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                    text: "adresse:    "),
                                                controller.details['adresse'] !=
                                                        null
                                                    ? TextSpan(
                                                        text: "",
                                                        children: [
                                                            TextSpan(
                                                                text: '',
                                                                children: [
                                                                  const TextSpan(
                                                                      text:
                                                                          "commArrond:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['commArrond'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "ville:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['ville'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "numero:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['numero'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "quartier:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['quartier'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "etatProvince:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['etatProvince'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "avenue:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['avenue'] ?? ''}\n"),
                                                                  const TextSpan(
                                                                      text:
                                                                          "codePostal:    "),
                                                                  TextSpan(
                                                                      text:
                                                                          "${controller.details['adresse']['codePostal'] ?? ''}\n"),
                                                                ]),
                                                          ])
                                                    : TextSpan(),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red),
                                        ),
                                        onPressed: () {},
                                        child: Text("Notifier")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                      ),
                                      onPressed: () {},
                                      child: Text("Suspendrer"),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.green,
                                        ),
                                      ),
                                      onPressed: () {
                                        //Get.to(DetailsBoutique());
                                      },
                                      child: Text("Plus d'infos"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
