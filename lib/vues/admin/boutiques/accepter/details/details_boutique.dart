import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_boutique_controller.dart';

class DetailsBoutique extends GetView<DetailsBoutiqueController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Row(),
    );
  }
}
