import 'package:africulture_desktop/vues/encours/detailscomp.dart';
import 'package:africulture_desktop/vues/encours/encourscontroller.dart';
import 'package:africulture_desktop/vues/encours/nouvellecompagne.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnCours extends StatelessWidget {
  //
  EnCoursController enCoursController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: ListView(
                      children: List.generate(5, (index) {
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: ListTile(
                              onTap: () {
                                enCoursController.detStat.value = true;
                              },
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                ),
                              ),
                              title: Text(
                                "listBonController.listeDeBons[index]['provenance']",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text.rich(
                                TextSpan(
                                  text:
                                      "listBonController.listeDeBons[index]['titre']",
                                  children: [
                                    TextSpan(
                                      text: "\n",
                                    ),
                                    TextSpan(
                                      text:
                                          "listBonController.listeDeBons[index]['content']",
                                    ),
                                    TextSpan(
                                      text: "\n",
                                    ),
                                    TextSpan(
                                      text:
                                          "Date limite ", //${listBonController.listeDeBons[index]['datelimite']}
                                      style: TextStyle(
                                        color: Colors.green.shade700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n",
                                    ),
                                    TextSpan(
                                      text: "122/300 bons disponibles",
                                      style: TextStyle(
                                        color: Colors.green.shade700,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      enCoursController.detStat.value = false;
                    },
                    child: const Text("Nouvelle compagne"),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Obx(
            () => enCoursController.detStat.value
                ? Container(
                    child: DetailsComp(),
                  )
                : Container(
                    child: NouvelleCompagne(),
                  ),
          ),
        )
      ],
    );
  }
}
