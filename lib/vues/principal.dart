import 'package:africulture_desktop/vues/encours/encourscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'accueil/accueil.dart';
import 'accueil/accueilController.dart';
import 'admin/agents/agent_controller.dart';
import 'login/login.dart';
import 'login/logincontroller.dart';

class Principal extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  AccueilController accueilController = Get.put(AccueilController());
  EnCoursController enCoursController = Get.put(EnCoursController());
  AgentController agentController = Get.put(AgentController());
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => loginController.loager.value ? Accueil() : Login(),
      ),
    );
  }
}
