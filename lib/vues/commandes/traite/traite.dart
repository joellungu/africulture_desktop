import 'package:africulture_desktop/vues/commandes/traite/traite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Traite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Traite();
  }
}

class _Traite extends State<Traite> with TickerProviderStateMixin {
  List angles = ["STANDARD", "EXPRESS"];
  late TabController _controller;
  //
  TraiteController controller = Get.find();

  @override
  void initState() {
    //
    _controller = TabController(length: angles.length, vsync: this);
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
                                      },
                                      leading: Icon(Icons.person),
                                      title: Text(
                                          "${controller.standards[index]['nom']} \n${controller.standards[index]['email']}"),
                                      subtitle: Text(
                                          "${controller.standards[index]['email']} \n ${controller.standards[index]['centreAppel']}"),
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
                      flex: 3,
                      child: Obx(
                        () => Container(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  width: double.maxFinite,
                                  color: Colors.blueGrey,
                                  child: RichText(
                                    text: TextSpan(text: '', children: [
                                      const TextSpan(text: "Nom:    "),
                                      TextSpan(
                                          text:
                                              "${controller.details['nom'] ?? ''}\n"),
                                      const TextSpan(text: "numero:    "),
                                      TextSpan(
                                          text:
                                              "${controller.details['numero'] ?? ''}\n"),
                                      const TextSpan(text: "adresse:    "),
                                      TextSpan(text: "", children: [
                                        TextSpan(text: '', children: [
                                          const TextSpan(
                                              text: "commArrond:    "),
                                          TextSpan(
                                              text:
                                                  "${controller.details['commArrond'] ?? ''}\n"),
                                          const TextSpan(text: "ville:    "),
                                          TextSpan(
                                              text:
                                                  "${controller.details['ville'] ?? ''}\n"),
                                          const TextSpan(text: "numero:    "),
                                          TextSpan(
                                              text:
                                                  "${controller.details['numero'] ?? ''}\n"),
                                          const TextSpan(text: "quartier:    "),
                                          TextSpan(
                                              text:
                                                  "${controller.details['quartier'] ?? ''}\n"),
                                          const TextSpan(
                                              text: "etatProvince:    "),
                                          TextSpan(
                                              text:
                                                  "${controller.details['etatProvince'] ?? ''}\n"),
                                          const TextSpan(text: "avenue:    "),
                                          TextSpan(
                                              text:
                                                  "${controller.details['avenue'] ?? ''}\n"),
                                          const TextSpan(text: "expresse:    "),
                                          TextSpan(
                                              text:
                                                  "${controller.details['expresse'] ?? ''}\n"),
                                          const TextSpan(
                                              text: "codePostal:    "),
                                          TextSpan(
                                              text:
                                                  "${controller.details['codePostal'] ?? ''}\n"),
                                        ]),
                                      ]),
                                      const TextSpan(text: "centreAppel:    "),
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
                                      const TextSpan(text: "expresse:    "),
                                      TextSpan(
                                          text:
                                              "${controller.details['expresse'] ?? ''}\n"),
                                      const TextSpan(text: "expedier:    "),
                                      TextSpan(
                                          text:
                                              "${controller.details['expedier'] ?? ''}\n"),
                                    ]),
                                  ),
                                ),
                                SizedBox(
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
                                        child: Text("Suspendrer")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green),
                                        ),
                                        onPressed: () {
                                          //Get.to(DetailsBoutique());
                                        },
                                        child: Text("Plus d'infos")),
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
                      flex: 3,
                      child: Obx(
                        () => Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                width: double.maxFinite,
                                color: Colors.blueGrey,
                                child: RichText(
                                  text: TextSpan(text: '', children: [
                                    const TextSpan(text: "Nom:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['nom'] ?? ''}\n"),
                                    const TextSpan(text: "adresse:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['adresse'] ?? ''}\n"),
                                    const TextSpan(text: "centreAppel:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['centreAppel'] ?? ''}\n"),
                                    const TextSpan(text: "codeLegal:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['codeLegal'] ?? ''}\n"),
                                    const TextSpan(text: "mdp:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['mdp'] ?? ''}\n"),
                                    const TextSpan(text: "Email:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['email'] ?? ''}\n"),
                                    const TextSpan(text: "statut:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['statut'] ?? ''}\n"),
                                    const TextSpan(text: "type:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['type'] ?? ''}\n"),
                                    const TextSpan(text: "rccm:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['rccm'] ?? ''}\n"),
                                    const TextSpan(text: "suspendre:    "),
                                    TextSpan(
                                        text:
                                            "${controller.details['suspendre'] ?? ''}\n"),
                                  ]),
                                ),
                              ),
                              SizedBox(
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
                                      child: Text("Suspendrer")),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                      ),
                                      onPressed: () {
                                        //Get.to(DetailsBoutique());
                                      },
                                      child: Text("Plus d'infos")),
                                ],
                              )
                            ],
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
