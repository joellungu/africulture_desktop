import 'dart:async';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:africulture_desktop/vues/admin/agents/agent_controller.dart';
import 'package:data_table_2/data_table_2.dart';
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
  List listeProduit = [];
  List listeProduitE = [];
  //
  Map<String, dynamic> dets1 = {};
  //
  Map<String, dynamic> dets2 = {};
  //
  Timer? time;
  //
  String select = "";

  @override
  void initState() {
    //
    _controller = TabController(length: angles.length, vsync: this);
    //
    controller.getStandards(false);
    //
    controller.getExpress(false);
    //
    time = Timer.periodic(const Duration(seconds: 10), (e) {
      //
      controller.getStandards(false);
      //
      controller.getExpress(false);
      //
    });
    //
    super.initState();
    //
  }

  @override
  void dispose() {
    time!.cancel();
    //
    super.dispose();
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
          child: Obx(
            () => TabBarView(
              controller: _controller,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 8,
                      child: DataTable2(
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        scrollController: ScrollController(),
                        showBottomBorder: true,
                        minWidth: 600,
                        columns: const [
                          DataColumn2(
                            label: Text('nom'),
                            size: ColumnSize.L,
                          ),
                          DataColumn(
                            label: Text('numero'),
                          ),
                          DataColumn(
                            label: Text('date'),
                          ),
                          DataColumn2(label: Text('pays'), size: ColumnSize.S),
                          DataColumn2(
                              label: Text('expedier'),
                              //numeric: true,
                              size: ColumnSize.S),
                          DataColumn2(
                            label: Text('Code'),
                            size: ColumnSize.S,
                          ),
                          DataColumn2(
                            label: Text('Produits'),
                            size: ColumnSize.S,
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          controller.standards.length,
                          (index) => DataRow(cells: [
                            DataCell(Text(
                              '${controller.standards[index]['nom']}',
                              style: TextStyle(
                                color:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? Colors.green.shade900
                                        : Colors.black,
                                fontWeight:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.standards[index]['numero']}',
                              style: TextStyle(
                                color:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? Colors.green.shade900
                                        : Colors.black,
                                fontWeight:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.standards[index]['date']}',
                              style: TextStyle(
                                color:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? Colors.green.shade900
                                        : Colors.black,
                                fontWeight:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.standards[index]['pays']}',
                              style: TextStyle(
                                color:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? Colors.green.shade900
                                        : Colors.black,
                                fontWeight:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.standards[index]['expedier']}',
                              style: TextStyle(
                                color:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? Colors.green.shade900
                                        : Colors.black,
                                fontWeight:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.standards[index]['code']}',
                              style: TextStyle(
                                color:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? Colors.green.shade900
                                        : Colors.black,
                                fontWeight:
                                    '${controller.standards[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.list,
                                  color:
                                      '${controller.standards[index]['code']}' ==
                                              select
                                          ? Colors.green.shade900
                                          : Colors.black,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      //
                                      select =
                                          '${controller.standards[index]['code']}';
                                      //
                                      dets1 = controller.standards[index];
                                      //
                                      listeProduit = controller.standards[index]
                                          ['panier']['liste'];
                                      //print(listeProduit);
                                    },
                                  );
                                },
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Produits",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListView(
                                children: List.generate(
                                  listeProduit.length,
                                  (index) {
                                    return Container(
                                      child: Row(
                                        /*
                                {
                                            "id": "${p['id']}",
                                            "titre": "${p['titreMar']}",
                                            "image":
                                                "produit/image/${p['id']}/img0",
                                            "devise": "${p['deviseMar']}",
                                            "prix": p['prixMar'],
                                            "paysOrigine": p['paysOrigine'],
                                            "codePays": p['codePays'],
                                            "quantite": quantite.value,
                                            "poidsUnitaire": p['poidsUnitaire'],
                                            //"poidsCh": produitController.pt
                                          }
                                */
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Image.network(
                                                  "${Utils.url}/${listeProduit[index]['image']}"),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "${listeProduit[index]['titre']}"),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "Quantité: ${listeProduit[index]['quantite']}"),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "Prix: ${listeProduit[index]['prix']}"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            listeProduit.isEmpty
                                ? Container()
                                : ElevatedButton(
                                    onPressed: () {
                                      menu(context, dets1);
                                    },
                                    child: Text("Action")),
                            Padding(
                              padding: EdgeInsets.all(5),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 8,
                      child: DataTable2(
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        scrollController: ScrollController(),
                        showBottomBorder: true,
                        minWidth: 600,
                        columns: const [
                          DataColumn2(
                            label: Text('nom'),
                            size: ColumnSize.L,
                          ),
                          DataColumn(
                            label: Text('numero'),
                          ),
                          DataColumn(
                            label: Text('date'),
                          ),
                          DataColumn2(label: Text('pays'), size: ColumnSize.S),
                          DataColumn2(
                              label: Text('expedier'),
                              //numeric: true,
                              size: ColumnSize.S),
                          DataColumn2(
                            label: Text('Code'),
                            size: ColumnSize.S,
                          ),
                          DataColumn2(
                            label: Text('Produits'),
                            size: ColumnSize.S,
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          controller.express.length,
                          (index) => DataRow(cells: [
                            DataCell(Text(
                              '${controller.express[index]['nom']}',
                              style: TextStyle(
                                color: '${controller.express[index]['code']}' ==
                                        select
                                    ? Colors.green.shade900
                                    : Colors.black,
                                fontWeight:
                                    '${controller.express[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.express[index]['numero']}',
                              style: TextStyle(
                                color: '${controller.express[index]['code']}' ==
                                        select
                                    ? Colors.green.shade900
                                    : Colors.black,
                                fontWeight:
                                    '${controller.express[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.express[index]['date']}',
                              style: TextStyle(
                                color: '${controller.express[index]['code']}' ==
                                        select
                                    ? Colors.green.shade900
                                    : Colors.black,
                                fontWeight:
                                    '${controller.express[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.express[index]['pays']}',
                              style: TextStyle(
                                color: '${controller.express[index]['code']}' ==
                                        select
                                    ? Colors.green.shade900
                                    : Colors.black,
                                fontWeight:
                                    '${controller.express[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.express[index]['expedier']}',
                              style: TextStyle(
                                color: '${controller.express[index]['code']}' ==
                                        select
                                    ? Colors.green.shade900
                                    : Colors.black,
                                fontWeight:
                                    '${controller.express[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(Text(
                              '${controller.express[index]['code']}',
                              style: TextStyle(
                                color: '${controller.express[index]['code']}' ==
                                        select
                                    ? Colors.green.shade900
                                    : Colors.black,
                                fontWeight:
                                    '${controller.express[index]['code']}' ==
                                            select
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            )),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.list,
                                  color:
                                      '${controller.express[index]['code']}' ==
                                              select
                                          ? Colors.green.shade900
                                          : Colors.black,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      //
                                      select =
                                          '${controller.express[index]['code']}';
                                      //
                                      dets2 = controller.express[index];
                                      //
                                      listeProduitE = controller.express[index]
                                          ['panier']['liste'];
                                      //print(listeProduit);
                                    },
                                  );
                                },
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Produits",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListView(
                                children: List.generate(
                                  listeProduitE.length,
                                  (index) {
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Image.network(
                                                  "${Utils.url}/${listeProduitE[index]['image']}"),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "${listeProduitE[index]['titre']}"),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "Quantité: ${listeProduitE[index]['quantite']}"),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "Prix: ${listeProduitE[index]['prix']}"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            listeProduitE.isEmpty
                                ? Container()
                                : ElevatedButton(
                                    onPressed: () {
                                      menu(context, dets2);
                                    },
                                    child: Text("Action")),
                            Padding(
                              padding: EdgeInsets.all(5),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  menu(BuildContext context, Map<dynamic, dynamic> det) {
    showDialog(
      context: context,
      builder: (c) {
        return Material(color: Colors.transparent, child: DetailsCommande(det));
      },
    );
  }
}

class DetailsCommande extends StatefulWidget {
  Map<dynamic, dynamic> det;
  DetailsCommande(this.det);
  @override
  State<StatefulWidget> createState() {
    return _DetailsCommande();
  }
}

class _DetailsCommande extends State<DetailsCommande> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 650,
        width: 550,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                const Text(
                  "Détails",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(text: "nom ", children: [
                          TextSpan(
                            text: "${widget.det['nom']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(text: "numero ", children: [
                          TextSpan(
                            text: "${widget.det['numero']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(text: "date ", children: [
                          TextSpan(
                            text: "${widget.det['date']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(text: "pays ", children: [
                          TextSpan(
                            text: "${widget.det['pays']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(text: "expedier ", children: [
                          TextSpan(
                            text: "${widget.det['expedier']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(text: "code ", children: [
                          TextSpan(
                            text: "${widget.det['code']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  //
                  ListProduitDansPanier("${widget.det['code']}"),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    //
                  },
                  child: const Text("Commande éffectué"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  onPressed: () {
                    //
                  },
                  child: const Text("Un problème de traitement"),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class ListProduitDansPanier extends StatefulWidget {
  String code = "";
  ListProduitDansPanier(this.code);
  @override
  State<StatefulWidget> createState() {
    return _ListProduitDansPanier();
  }
}

class _ListProduitDansPanier extends State<ListProduitDansPanier> {
  EncoursController controller = Get.find();

  @override
  void initState() {
    controller.vendeurcommandePanierProduit(widget.code);
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("infos:");
    return Obx(
      () => Column(
        children: List.generate(
          controller.listProduitDansPanier.value.length,
          (index) => ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: 400,
                        width: 300,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: DetailsProduitCommander(
                                controller.listProduitDansPanier.value[index],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            leading: Icon(Icons.border_outer_rounded),
            title: Text(
              "${controller.listProduitDansPanier.value[index]['titre']}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), //
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                controller.listProduitDansPanier.value[index]['stRecu'] == null
                    ? Icon(
                        Icons.close,
                        color: Colors.red.shade700,
                      )
                    : Icon(
                        Icons.check_circle,
                        color: Colors.green.shade700,
                      ),
                controller.listProduitDansPanier.value[index]['stVerifier'] ==
                        null
                    ? Icon(
                        Icons.close,
                        color: Colors.red.shade700,
                      )
                    : Icon(
                        Icons.check_circle,
                        color: Colors.green.shade700,
                      ),
                controller.listProduitDansPanier.value[index]['stStocker'] ==
                        null
                    ? Icon(
                        Icons.close,
                        color: Colors.red.shade700,
                      )
                    : Icon(
                        Icons.check_circle,
                        color: Colors.green.shade700,
                      ),
                controller.listProduitDansPanier.value[index]['stLivre'] == null
                    ? Icon(
                        Icons.close,
                        color: Colors.red.shade700,
                      )
                    : Icon(
                        Icons.check_circle,
                        color: Colors.green.shade700,
                      ),
                Text(
                    "Quantité: ${controller.listProduitDansPanier.value[index]['quantite']}"),
              ],
            ),
            /*
            trailing: controller.listProduitDansPanier.value[index]['statut']
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.close,
                    color: Colors.red.shade700,
                  ),
                  */
          ),
        ),
      ),
    );
  }
}

class DetailsProduitCommander extends StatefulWidget {
  Map<String, dynamic> infos = Map<String, dynamic>();
  DetailsProduitCommander(this.infos);
  @override
  State<StatefulWidget> createState() {
    return _DetailsProduitCommander();
  }
}

class _DetailsProduitCommander extends State<DetailsProduitCommander> {
  AgentController controller = Get.find();
  RxMap<String, dynamic> agt1 = RxMap<String, dynamic>();
  RxMap<String, dynamic> agt2 = RxMap<String, dynamic>();
  RxMap<String, dynamic> agt3 = RxMap<String, dynamic>();
  RxMap<String, dynamic> agt4 = RxMap<String, dynamic>();
  RxString cc = "".obs;

  load() async {
    agt1.value = await controller.getAgent("${widget.infos['idagentStRecu']}");
    agt2.value =
        await controller.getAgent("${widget.infos['idagentStVerifier']}");
    agt3.value =
        await controller.getAgent("${widget.infos['idagentStStocker']}");
    agt4.value = await controller.getAgent("${widget.infos['idagentStLivre']}");
  }

  @override
  void initState() {
    load();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 400,
        width: 300,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${widget.infos['titre']}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            widget.infos['stRecu'] == null
                ? Icon(
                    Icons.close,
                    color: Colors.red.shade700,
                  )
                : ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade700,
                    ),
                    title: Text(
                        "${agt1['nom']} ${agt1['postnom']} ${agt1['prenom']}"),
                    subtitle: Text("${agt1['role']}  ${widget.infos['d1']}"),
                  ),
            widget.infos['stVerifier'] == null
                ? Icon(
                    Icons.close,
                    color: Colors.red.shade700,
                  )
                : ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade700,
                    ),
                    title: Text(
                        "${agt2['nom']} ${agt2['postnom']} ${agt2['prenom']}"),
                    subtitle: Text("${agt2['role']}  ${widget.infos['d2']}"),
                  ),
            widget.infos['stStocker'] == null
                ? Icon(
                    Icons.close,
                    color: Colors.red.shade700,
                  )
                : ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade700,
                    ),
                    title: Text(
                        "${agt3['nom']} ${agt3['postnom']} ${agt3['prenom']}"),
                    subtitle: Text("${agt3['role']}  ${widget.infos['d3']}"),
                  ),
            widget.infos['stLivre'] == null
                ? Icon(
                    Icons.close,
                    color: Colors.red.shade700,
                  )
                : ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade700,
                    ),
                    title: Text(
                        "${agt4['nom']} ${agt4['postnom']} ${agt4['prenom']}"),
                    subtitle: Text("${agt4['role']}  ${widget.infos['d4']}"),
                  ),
            Text("Quantité: ${widget.infos['quantite']}"),
            Text("$cc"),
          ],
        ),
      ),
    );
  }
}
