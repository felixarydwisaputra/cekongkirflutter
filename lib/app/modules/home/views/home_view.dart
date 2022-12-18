import 'package:cekongkir/app/data/models/kota_model.dart';
import 'package:cekongkir/app/data/models/provinsi_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'CekOngkir.',
          style: TextStyle(
            fontFamily: "Rubik Puddles",
            fontWeight: FontWeight.bold,
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          Text("Dari : "),
          SizedBox(
            height: 15,
          ),
          DropdownSearch<Provinsi>(
            asyncItems: (text) async {
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/province",
                queryParameters: {"key": "7e29ffa20c825c9d734d5b79ced0316b"},
              );
              var data =
                  Provinsi.fromJsonLIst(response.data["rajaongkir"]["results"]);
              return data;
            },
            onChanged: (value) =>
                controller.provasalID.value = value?.provinceId ?? "0",
            itemAsString: (item) => item.province!,
            popupProps: PopupProps.dialog(
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.province}"),
              ),
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: "cari provinsi",
                ),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih provinsi asal",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DropdownSearch<Kota>(
            asyncItems: (text) async {
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/city?province=${controller.provasalID}",
                queryParameters: {"key": "7e29ffa20c825c9d734d5b79ced0316b"},
              );
              var data =
                  Kota.fromJsonLIst(response.data["rajaongkir"]["results"]);
              return data;
            },
            onChanged: (value) =>
                controller.kotaasalID.value = value?.cityId ?? "0",
            itemAsString: (item) => item.cityName!,
            popupProps: PopupProps.dialog(
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.type} ${item.cityName}"),
              ),
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: "cari kota",
                ),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih kota asal",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Ke : "),
          SizedBox(
            height: 15,
          ),
          DropdownSearch<Provinsi>(
            asyncItems: (text) async {
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/province",
                queryParameters: {"key": "7e29ffa20c825c9d734d5b79ced0316b"},
              );
              var data =
                  Provinsi.fromJsonLIst(response.data["rajaongkir"]["results"]);
              return data;
            },
            onChanged: (value) =>
                controller.provtujuanID.value = value?.provinceId ?? "0",
            itemAsString: (item) => item.province!,
            popupProps: PopupProps.dialog(
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.province}"),
              ),
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: "cari provinsi",
                ),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih provinsi tujuan",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DropdownSearch<Kota>(
            asyncItems: (text) async {
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/city?province=${controller.provtujuanID}",
                queryParameters: {"key": "7e29ffa20c825c9d734d5b79ced0316b"},
              );
              var data =
                  Kota.fromJsonLIst(response.data["rajaongkir"]["results"]);
              return data;
            },
            onChanged: (value) =>
                controller.kotatujuanID.value = value?.cityId ?? "0",
            itemAsString: (item) => item.cityName!,
            popupProps: PopupProps.dialog(
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.type} ${item.cityName}"),
              ),
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: "cari kota",
                ),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih kota tujuan",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: controller.beratC,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffix: Text("gram"),
              border: OutlineInputBorder(),
              labelText: "Berat barang",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DropdownSearch<Map<String, dynamic>>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih kurir",
                border: OutlineInputBorder(),
              ),
            ),
            itemAsString: (item) => item["name"],
            items: [
              {
                "code": "jne",
                "name": "JNE",
              },
              {
                "code": "pos",
                "name": "POS Indonesia",
              },
              {
                "code": "tiki",
                "name": "TIKI",
              },
            ],
            onChanged: (value) => controller.codeKurir.value = value?["code"],
            popupProps: PopupProps.dialog(
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item["name"]}"),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Obx(
            () => ElevatedButton(
              onPressed: () {
                if (controller.isLoading.isFalse) {
                  controller.cekOngkir();
                }
              },
              child: Text(
                  controller.isLoading.isFalse ? "Cek Ongkir" : "Loading.."),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
