import 'package:get/get.dart';

import '../models/kota_model.dart';

class KotaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Kota.fromJson(map);
      if (map is List) return map.map((item) => Kota.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Kota?> getKota(int id) async {
    final response = await get('kota/$id');
    return response.body;
  }

  Future<Response<Kota>> postKota(Kota kota) async => await post('kota', kota);
  Future<Response> deleteKota(int id) async => await delete('kota/$id');
}
