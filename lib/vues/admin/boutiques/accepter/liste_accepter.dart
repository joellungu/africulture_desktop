import 'package:africulture_desktop/vues/admin/boutiques/accepter/accepter_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details/details_boutique.dart';

class ListageAccepter extends GetView<AccepterController> {
  //
  //AgentController agentController = Get.find();

  @override
  Widget build(BuildContext context) {
    //
    controller.allAcceptes();
    //
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      columns: const [
        DataColumn2(
          label: Text('Nom'),
          size: ColumnSize.L,
        ),
        DataColumn(
          label: Text('adresse'),
        ),
        DataColumn(
          label: Text("Centre d'appel"),
        ),
        DataColumn(
          label: Text('Email'),
        ),
        DataColumn(
          label: Text('Statut'),
          numeric: true,
        ),
        DataColumn(
          label: Text('Type'),
        ),
        DataColumn(
          label: Text('Rccm'),
        ),
      ],
      rows: List<DataRow>.generate(
        controller.accepter.length,
        (index) => DataRow(
            onLongPress: (() => menu(context, controller.accepter[index])),
            cells: [
              DataCell(Text('${controller.accepter[index]['nom']}')),
              DataCell(Text('${controller.accepter[index]['adresse']}')),
              DataCell(Text('${controller.accepter[index]['centreAppel']}')),
              DataCell(Text('${controller.accepter[index]['email']}')),
              DataCell(Text('${controller.accepter[index]['statut']}')),
              DataCell(Text('${controller.accepter[index]['type']}')),
              DataCell(Text('${controller.accepter[index]['rccm']}')),
            ]),
      ),
    );
  }

  menu(BuildContext context, Map<dynamic, dynamic> d) {
    showDialog(
      context: context,
      builder: (c) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              height: 150,
              width: 400,
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
                        "Menu",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () {},
                          child: Text("Notifier")),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () {
                            d['suspendre'] = true;
                            d['statut'] = "bloquer";
                            //
                            controller.updateDemandeur(d);
                          },
                          child: Text("Suspendrer")),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          onPressed: () {
                            Get.to(DetailsBoutique());
                          },
                          child: Text("Plus d'infos")),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



/*
Row(
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
                        controller.accepter.length,
                        (index) => ListTile(
                          onTap: () {
                            controller.details.value =
                                controller.accepter[index];
                            //print(controller.details.value);
                          },
                          leading: Icon(Icons.person),
                          title: Text(
                              "${controller.accepter[index]['nom']} \n${controller.accepter[index]['email']}"),
                          subtitle: Text(
                              "${controller.accepter[index]['email']} \n ${controller.accepter[index]['centreAppel']}"),
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
                        TextSpan(text: "${controller.details['nom'] ?? ''}\n"),
                        const TextSpan(text: "adresse:    "),
                        TextSpan(
                            text: "${controller.details['adresse'] ?? ''}\n"),
                        const TextSpan(text: "centreAppel:    "),
                        TextSpan(
                            text:
                                "${controller.details['centreAppel'] ?? ''}\n"),
                        const TextSpan(text: "codeLegal:    "),
                        TextSpan(
                            text: "${controller.details['codeLegal'] ?? ''}\n"),
                        const TextSpan(text: "mdp:    "),
                        TextSpan(text: "${controller.details['mdp'] ?? ''}\n"),
                        const TextSpan(text: "Email:    "),
                        TextSpan(
                            text: "${controller.details['email'] ?? ''}\n"),
                        const TextSpan(text: "statut:    "),
                        TextSpan(
                            text: "${controller.details['statut'] ?? ''}\n"),
                        const TextSpan(text: "type:    "),
                        TextSpan(text: "${controller.details['type'] ?? ''}\n"),
                        const TextSpan(text: "rccm:    "),
                        TextSpan(text: "${controller.details['rccm'] ?? ''}\n"),
                        const TextSpan(text: "suspendre:    "),
                        TextSpan(
                            text: "${controller.details['suspendre'] ?? ''}\n"),
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
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () {},
                          child: Text("Notifier")),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () {
                            controller.details['suspendre'] = true;
                            controller.details['statut'] = "bloquer";
                            //
                            controller.updateDemandeur(controller.details);
                          },
                          child: Text("Suspendrer")),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          onPressed: () {
                            Get.to(DetailsBoutique());
                          },
                          child: Text("Plus d'infos")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    )
*/