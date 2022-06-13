import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'agent_controller.dart';

class ListageAgent extends GetView<AgentController> {
  //
  //AgentController agentController = Get.find();

  @override
  Widget build(BuildContext context) {
    //
    controller.allAgents();
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
                        controller.agents.length,
                        (index) => ListTile(
                          onTap: () {
                            controller.details.value = controller.agents[index];
                            //print(controller.details.value);
                          },
                          leading: Icon(Icons.person),
                          title: Text("${controller.agents[index]['nom']}"),
                          subtitle: Text(
                              "${controller.agents[index]['postnom']}  ${controller.agents[index]['prenom']}"),
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
                        const TextSpan(text: "Postnom:    "),
                        TextSpan(
                            text: "${controller.details['postnom'] ?? ''}\n"),
                        const TextSpan(text: "Prenom:    "),
                        TextSpan(
                            text: "${controller.details['prenom'] ?? ''}\n"),
                        const TextSpan(text: "Sexe:    "),
                        TextSpan(text: "${controller.details['sexe'] ?? ''}\n"),
                        const TextSpan(text: "Numero:    "),
                        TextSpan(
                            text: "${controller.details['numero'] ?? ''}\n"),
                        const TextSpan(text: "Email:    "),
                        TextSpan(
                            text: "${controller.details['email'] ?? ''}\n"),
                        const TextSpan(text: "Etat civil:    "),
                        TextSpan(
                            text: "${controller.details['etatCivil'] ?? ''}\n"),
                        const TextSpan(text: "Nationalité:    "),
                        TextSpan(
                            text:
                                "${controller.details['nationalite'] ?? ''}\n"),
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
                                MaterialStateProperty.all(Colors.green),
                          ),
                          onPressed: () {},
                          child: Text("Mettre à jour")),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                          ),
                          onPressed: () {},
                          child: Text("Suspendre")),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () {},
                          child: Text("Supprimer")),
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
