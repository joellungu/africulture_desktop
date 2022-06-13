import 'dart:convert';

import 'package:africulture_desktop/utils/utils.dart';
import 'package:get/get.dart';

class CreationConnexion extends GetConnect {
  Future<Response> enregistreProduit(Map<String, dynamic> p) async =>
      await post("${Utils.url}/produit/save", jsonEncode(p));

  Future<Response> enregistrerImageProduit(
          List<Map<String, dynamic>> p) async =>
      await post("${Utils.url}/produit/saveimage", jsonEncode(p));

  Future<Response> saveFile(List<int> image) async {
    final form = FormData({"file": MultipartFile(image, filename: "gallery")});

    return post("${Utils.url}/produit/saveimage", form);
  }
}
