import 'dart:convert';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:africulture_desktop/vues/vendeurs/vendeur_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TopBar extends GetView<VendeurController> {
  //

  TopBar() {
    //print("${categorie!}");
    //controller.getParCategorieForAdmin(categorie!, aff);
    //
  }
  //VendeurController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    //
    return controller.obx(
      (state) => Row(
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
              child: state!.isNotEmpty
                  ? ListView(
                      controller: ScrollController(),
                      children: List.generate(
                        controller.produits.length,
                        (index) {
                          print(
                              "____________:::::::::::::${state[index]['id']}");
                          //
                          //controller.getListeImages(
                          // "${controller.produits[index]['id']}");
                          //
                          return ListTile(
                            onTap: () {
                              //

                              controller.details.value = state[index];
                              //print(controller.details.value);
                            },
                            leading: Container(
                              height: 150,
                              width: 100,
                              child: Image.network(
                                "${Utils.url}/produit/image/${state[index]['id']}/img0",
                                fit: BoxFit.fill,
                              ),
                              //LoadImage("${state[index]['id']}"),
                            ),
                            /* controller.images.isEmpty
                                    ? Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        child: Icon(
                                            Icons.production_quantity_limits),
                                      )
                                    : Container(
                                        height: 150,
                                        width: 150,
                                        alignment: Alignment.center,
                                        child: Image.network(
                                            "${Utils.url}/produit/image/${controller.images[0]}"),
                                      ),
                                      */
                            title: Text("${state[index]['titreMar']}"),
                            subtitle: Text(
                                "${state[index]['prixMar']}  ${state[index]['deviseMar']}\nStock: ${state[index]['prixMar']}"),
                          );
                        },
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
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.maxFinite,
                    color: Colors.blueGrey,
                    child: Obx(
                      () => RichText(
                        text: TextSpan(text: '', children: [
                          const TextSpan(text: "titreMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['titreMar'] ?? ''}\n"),
                          const TextSpan(text: "deviseMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['deviseMar'] ?? ''}\n"),
                          const TextSpan(text: "prixMar:    "),
                          TextSpan(
                              text: "${controller.details['prixMar'] ?? ''}\n"),
                          const TextSpan(text: "stockMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['stockMar'] ?? ''}\n"),
                          const TextSpan(text: "likeMar:    "),
                          TextSpan(
                              text: "${controller.details['likeMar'] ?? ''}\n"),
                          const TextSpan(text: "descriptionMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['descriptionMar'] ?? ''}\n"),
                          const TextSpan(text: "infosSupplementaireMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['infosSupplementaireMar'] ?? ''}\n"),
                          const TextSpan(text: "categorieMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['categorieMar'] ?? ''}\n"),
                          const TextSpan(text: "poidUnitaureMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['poidUnitaureMar'] ?? ''}\n"),
                          const TextSpan(text: "datePosterMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['datePosterMar'] ?? ''}\n"),
                          const TextSpan(text: "categorieMar:    "),
                          TextSpan(
                              text:
                                  "${controller.details['categorieMar'] ?? ''}\n"),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 5,
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
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {},
                          child: Text("Commentaire")),
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
          Expanded(
            flex: 3,
            child: Obx(
              () => controller.details['id'] != null
                  ? Container(
                      padding: EdgeInsets.all(20),
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio: 0.8,
                        children: List.generate(
                          controller.details['nombreImages'],
                          (index) => Card(
                            elevation: 0,
                            child: InkWell(
                              onTap: () {
                                //lienImage.value = "produit/image/${p['id']}/img$index";
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Image.network(
                                  "${Utils.url}/produit/image/${controller.details['id']}/img$index",
                                  fit: BoxFit.fill,
                                ),
                                //color: Colors.yellowAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
      onLoading: Center(
        child: Container(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
      onEmpty: Center(
        child: Text("Rien du tout bro"),
      ),
      onError: (erreur) => Text("Erreur"),
    );
  }
}

class LoadImage extends StatefulWidget {
  String? id;
  LoadImage(this.id);
  @override
  State<StatefulWidget> createState() {
    return _LoadImage();
  }
}

class _LoadImage extends State<LoadImage> {
  VendeurController vendeurController = Get.find();
  Future<Widget> getProduitImage() async {
    VendeurConnexion vendeurConnexion = VendeurConnexion();
    //
    //print('___________$categorie _______________');
    //

    //
    //DemandeurConnexion sc = DemandeurConnexion();
    Response rep = await vendeurConnexion.getListeImages(widget.id!);
    //Response rep =
    //  await await demandeurConnexion.getListeImages("${widget.id}");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //vendeurController.images.value = jsonDecode(rep.bodyString!);
      vendeurController.images.value = jsonDecode(rep.bodyString!);
      print(vendeurController.images.value);
      if (vendeurController.images.value.isEmpty) {
        return Container();
      } else {
        return Container(
          child: Image.network(
            "${Utils.url}/produit/image/${vendeurController.images[0]}",
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProduitImage(),
        builder: (context, t) {
          if (t.hasData) {
            return t.data as Widget;
          } else if (t.hasError) {
            return Icon(Icons.error_outline);
          }
          return Container(
            //color: Colors.green.shade200,
            height: 200,
            width: 100,
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /*
                  Container(
                    height: 10,
                    width: 2,
                    color: Colors.grey.shade100,
                  ),
                  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 10,
                          width: 20,
                          color: Colors.grey.shade100,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 20,
                          width: 50,
                          color: Colors.grey.shade100,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
