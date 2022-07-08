import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'listage_controller.dart';

class ListageProduit extends GetView<ListageController> {
  //
  String pa = "AFRICULTURE";
  //
  ListageProduit() {
    //controller.load();
    controller.listeClient.value.add(pa);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: "AFRICULTURE",
                    items: List.generate(controller.listeClient.value.length,
                        (index) {
                      return DropdownMenuItem<String>(
                        value: "AFRICULTURE",
                        child: Text("${controller.listeClient.value[index]}"),
                      );
                    }),
                    onChanged: (e) {
                      //setState(() {
                      pa = e!;
                      //});
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            child: Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Part {
  String? id;
  String? nom;
  Part({this.id, this.nom});
}
