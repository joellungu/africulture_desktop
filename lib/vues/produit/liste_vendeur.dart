import 'dart:convert';
import 'package:africulture_desktop/utils/utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'produit_controller.dart';

class ListageVendeur extends StatefulWidget {
  String? categorie;
  String aff = "";
  bool? topbar;
  ListageVendeur(Key key, this.categorie, this.aff, this.topbar)
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ListageVendeur();
  }
}

class _ListageVendeur extends State<ListageVendeur> {
  //
  ProduitController controller = Get.find();
  //
  RxString idprod = "".obs;
  String select = "";
  Map<String, dynamic> details = {};

  //VendeurController controller = Get.find();

  @override
  void initState() {
    controller.getParCategorieForAdmin(widget.categorie!, widget.aff);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return controller.obx(
      (state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 7,
            child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn2(
                  label: Text(
                    'titreMar',
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('deviseMar'),
                  size: ColumnSize.S,
                ),
                DataColumn(
                  label: Text("prixMar"),
                ),
                DataColumn(
                  label: Text('poidsUnitaire'),
                ),
                DataColumn2(
                  label: Text('uniteP'),
                  size: ColumnSize.S,
                ),
                DataColumn(
                  label: Text('stockMar'),
                ),
                DataColumn(
                  label: Text('datePosterMar'),
                ),
                DataColumn2(
                  label: Text('Details'),
                  size: ColumnSize.S,
                ),
              ],
              rows: List<DataRow>.generate(
                state!.length, //onLongPress: (() => menu(context)),
                (index) => DataRow(cells: [
                  DataCell(Text(
                    '${state[index]['titreMar']}',
                    style: TextStyle(
                      color: '${state[index]['datePosterMar']}' == select
                          ? Colors.green.shade900
                          : Colors.black,
                      fontWeight: '${state[index]['datePosterMar']}' == select
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    '${state[index]['deviseMar']}',
                    style: TextStyle(
                      color: '${state[index]['datePosterMar']}' == select
                          ? Colors.green.shade900
                          : Colors.black,
                      fontWeight: '${state[index]['datePosterMar']}' == select
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    '${state[index]['prixMar']}',
                    style: TextStyle(
                      color: '${state[index]['datePosterMar']}' == select
                          ? Colors.green.shade900
                          : Colors.black,
                      fontWeight: '${state[index]['datePosterMar']}' == select
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    '${state[index]['poidsUnitaire']}',
                    style: TextStyle(
                      color: '${state[index]['datePosterMar']}' == select
                          ? Colors.green.shade900
                          : Colors.black,
                      fontWeight: '${state[index]['datePosterMar']}' == select
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    '${state[index]['uniteP']}',
                    style: TextStyle(
                      color: '${state[index]['datePosterMar']}' == select
                          ? Colors.green.shade900
                          : Colors.black,
                      fontWeight: '${state[index]['datePosterMar']}' == select
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    '${state[index]['stockMar']}',
                    style: TextStyle(
                      color: '${state[index]['datePosterMar']}' == select
                          ? Colors.green.shade900
                          : Colors.black,
                      fontWeight: '${state[index]['datePosterMar']}' == select
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    '${state[index]['datePosterMar']}',
                    style: TextStyle(
                      color: '${state[index]['datePosterMar']}' == select
                          ? Colors.green.shade900
                          : Colors.black,
                      fontWeight: '${state[index]['datePosterMar']}' == select
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                  DataCell(
                    IconButton(
                      icon: Icon(
                        Icons.list,
                        color: '${state[index]['datePosterMar']}' == select
                            ? Colors.green.shade900
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            controller.details.value = state[index];
                            //
                            select = '${state[index]['datePosterMar']}';
                            //
                            details = state[index];
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
            child: Obx(
              () => controller.details['id'] != null
                  ? Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
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
                          ),
                          ElevatedButton(
                            onPressed: () {
                              menu(context, controller.details.value,
                                  widget.topbar!);
                            },
                            child: Text("Détails"),
                          )
                        ],
                      ))
                  : Container(),
            ),
          )
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
      )
  */

  menu(BuildContext context, Map<dynamic, dynamic> det, bool v) {
    /*
        Long idfournisseur;
    //String titreMar;
    //String deviseMar;
    //Double prixMar;
    //Double poidsUnitaire;
    //int stockMar;
    //String uniteP;
    int likeMar;
    //String descriptionMar;
    //String infosSupplementaireMar;
    //String categorieMar;
    Long posterparMar;
    //String datePosterMar;
    String filtreMar;
    Boolean statutMar;
    Boolean promotion;
    double prixRabes;
    int nombreImages;
    //String nomBoutique;
    Boolean topbar;
    String paysOrigine;
    String codePays;
    double longueur;
    double largeur;
    double profondeur;

    */
    showDialog(
      context: context,
      builder: (c) {
        return Material(
          color: Colors.transparent,
          child: Center(
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
                  Expanded(
                    flex: 1,
                    child: ListView(
                      padding: EdgeInsets.all(20),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(text: "titreMar ", children: [
                                TextSpan(
                                  text: "${det['titreMar']}",
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
                              TextSpan(text: "deviseMar ", children: [
                                TextSpan(
                                  text: "${det['deviseMar']}",
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
                              TextSpan(text: "prixMar ", children: [
                                TextSpan(
                                  text: "${det['prixMar']}",
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
                              TextSpan(text: "poidsUnitaire ", children: [
                                TextSpan(
                                  text: "${det['poidsUnitaire']}",
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
                              TextSpan(text: "uniteP ", children: [
                                TextSpan(
                                  text: "${det['uniteP']}",
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
                              TextSpan(text: "stockMar ", children: [
                                TextSpan(
                                  text: "${det['stockMar']}",
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
                              TextSpan(
                                text: "descriptionMar ",
                                children: [
                                  TextSpan(
                                    ///${vendeurController.infosPerso['nom']}
                                    text: "${det['descriptionMar']}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                  text: "infosSupplementaireMar ",
                                  children: [
                                    TextSpan(
                                      text: "${det['infosSupplementaireMar']}",
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
                              TextSpan(text: "categorieMar ", children: [
                                TextSpan(
                                  text: "${det['categorieMar']}",
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
                              TextSpan(text: "datePosterMar ", children: [
                                TextSpan(
                                  text: "${det['datePosterMar']}",
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
                              TextSpan(text: "nomBoutique ", children: [
                                TextSpan(
                                  text: "${det['nomBoutique']}",
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
                              TextSpan(text: "longueur ", children: [
                                TextSpan(
                                  text: "${det['longueur']}",
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
                              TextSpan(text: "largeur ", children: [
                                TextSpan(
                                  text: "${det['largeur']}",
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
                              TextSpan(
                                text: "profondeur ",
                                children: [
                                  TextSpan(
                                    ///${vendeurController.infosPerso['nom']}
                                    text: "${det['profondeur']}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "statutMar ",
                                children: [
                                  TextSpan(
                                    ///${vendeurController.infosPerso['nom']}
                                    text: "${det['statutMar']}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  v
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                              onPressed: () {
                                det['topbar'] = true;
                                controller.updateProduit(det, true);
                              },
                              child: const Text("Mettre"),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange),
                              ),
                              onPressed: () {
                                det['topbar'] = false;
                                controller.updateProduit(det, true);
                              },
                              child: const Text("Enlever"),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  //

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
  ProduitController vendeurController = Get.find();
  Future<Widget> getProduitImage() async {
    ProduitConnexion vendeurConnexion = ProduitConnexion();
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
