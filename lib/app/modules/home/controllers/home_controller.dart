import 'dart:convert';

import 'package:cekongkir/app/data/models/ongkir_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController beratC = TextEditingController();

  RxBool isLoading = false.obs;

  List<Ongkir> ongkir = [];

  RxString provasalID = "0".obs;
  RxString provtujuanID = "0".obs;
  RxString kotaasalID = "0".obs;
  RxString kotatujuanID = "0".obs;

  RxString codeKurir = "".obs;

  void cekOngkir() async {
    if (provasalID != "0" &&
        provtujuanID != "0" &&
        kotaasalID != "0" &&
        kotatujuanID != "0" &&
        codeKurir != "" &&
        beratC.text != "") {
      try {
        isLoading.value = true;
        var response = await http.post(
          Uri.parse("https://api.rajaongkir.com/starter/cost"),
          headers: {
            "key": "7e29ffa20c825c9d734d5b79ced0316b",
          },
          body: {
            "origin": kotaasalID.value,
            "destination": kotatujuanID.value,
            "weight": beratC.text,
            "courier": codeKurir.value,
          },
        );
        isLoading.value = false;
        List rajaongkir = json.decode(response.body)["rajaongkir"]["results"][0]
            ["costs"] as List;
        ongkir = Ongkir.fromJsonLIst(rajaongkir);

        Get.defaultDialog(
            title: "Ongkos Kirim",
            content: Column(
              children: ongkir
                  .map((e) => ListTile(
                        title: Text("${e.service}"),
                        subtitle: Text("${e.description}"),
                        trailing: Text("Rp ${e.cost![0].value}"),
                      ))
                  .toList(),
            ));
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          content: Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Data yang anda masukkan belum lengkap",
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        content: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            "Data yang anda masukkan belum lengkap",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
