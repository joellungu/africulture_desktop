import 'dart:convert';
import 'dart:io';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:get/get.dart';

class AgenceController extends GetxController {
  //
  AgenceConnexion agenceConnexion = AgenceConnexion();
  //
  enregistreProduit(Map<String, dynamic> p, String paths) async {
    Response rep = await agenceConnexion.enregistreProduit(p);

    if (rep.statusCode == 200 || rep.statusCode == 200) {
      Map<String, dynamic> m = jsonDecode(rep.bodyString!);
      print(m);
      Response r = await agenceConnexion.enregistrerImageProduit(
          {'idAgence': m['id'], 'imageLogo': File(paths).readAsBytesSync()});
      if (r.statusCode == 200 || r.statusCode == 204 || r.statusCode == 201) {
        Get.back();
        Get.snackbar(
          "SUCCESS",
          "Enregistrement éffectué",
          duration: Duration(seconds: 7),
        );
      } else {
        print(r.statusCode);
        Get.back();
        Get.snackbar(
          "ERREUR",
          "Enregistrement non éffectué",
          duration: Duration(seconds: 7),
        );
      }
      //return jsonDecode(rep.bodyString!)['id'];
    } else {
      Get.back();
      Get.snackbar(
        "ERREUR",
        "Enregistrement non éffectué",
        duration: Duration(seconds: 7),
      );
      //return 0;
    }
  }
}

class AgenceConnexion extends GetConnect {
  //
  Future<Response> enregistreProduit(Map<String, dynamic> p) async =>
      await post("${Utils.url}/agence/save", jsonEncode(p));

  Future<Response> enregistrerImageProduit(Map<String, dynamic> p) async =>
      await post("${Utils.url}/agence/logo", jsonEncode(p),
          headers: {"contentType": "application/octet-stream"});

  Future<Response> saveFile(List<int> image) async {
    final form = FormData({"file": MultipartFile(image, filename: "gallery")});

    return post("${Utils.url}/agence/logo", form);
  }
}
