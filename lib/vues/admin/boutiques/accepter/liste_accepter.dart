import 'package:africulture_desktop/vues/admin/boutiques/accepter/accepter_controller.dart';
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
    return Row(
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
                            controller.details['statut'] = "bloqué";
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
    );
  }
}
