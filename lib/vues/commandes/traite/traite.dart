import 'dart:async';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:africulture_desktop/vues/commandes/encours/encours_controller.dart';
import 'package:africulture_desktop/vues/commandes/traite/traite_controller.dart';
import 'package:data_table_2/data_table_2.dart';
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

  TraiteController controller = Get.find();
  List listeProduit = [];
  List listeProduitE = [];
  //
  Timer? time;
  //
  String select = "";
  //
  DateTime d1 = DateTime.now();
  DateTime d2 = DateTime.now();

  @override
  void initState() {
    //
    _controller = TabController(length: angles.length, vsync: this);
    //
    controller.getStandards();
    //
    controller.getExpress();

    //
    time = Timer.periodic(const Duration(seconds: 10), (e) {
      //
      controller.getStandards();
      //
      controller.getExpress();
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
                      flex: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Recherche",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(3000),
                                            ).then((value) {
                                              setState(() {
                                                d1 = value!;
                                              });
                                            });
                                          },
                                          icon: Icon(Icons.date_range),
                                        ),
                                        Text(
                                            "  De  ${d1.day}/${d1.month}/${d1.year}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(3000),
                                            ).then((value) {
                                              setState(() {
                                                d2 = value!;
                                              });
                                            });
                                          },
                                          icon: Icon(Icons.date_range),
                                        ),
                                        Text(
                                            "  A  ${d2.day}/${d2.month}/${d2.year}")
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Recherche"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            listeProduit.isEmpty
                                ? Container()
                                : ElevatedButton(
                                    onPressed: () {}, child: Text("Action")),
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
                    ),
                    Expanded(
                      flex: 6,
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
                                    onPressed: () {}, child: Text("Action")),
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
                            listeProduit.isEmpty
                                ? Container()
                                : ElevatedButton(
                                    onPressed: () {}, child: Text("Action")),
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
}
