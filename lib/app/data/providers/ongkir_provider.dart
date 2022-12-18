import 'package:get/get.dart';

import '../models/ongkir_model.dart';

class OngkirProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Ongkir.fromJson(map);
      if (map is List) return map.map((item) => Ongkir.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Ongkir?> getOngkir(int id) async {
    final response = await get('ongkir/$id');
    return response.body;
  }

  Future<Response<Ongkir>> postOngkir(Ongkir ongkir) async =>
      await post('ongkir', ongkir);
  Future<Response> deleteOngkir(int id) async => await delete('ongkir/$id');
}
