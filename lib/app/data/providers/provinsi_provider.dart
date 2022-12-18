import 'package:get/get.dart';

import '../models/provinsi_model.dart';

class ProvinsiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Provinsi.fromJson(map);
      if (map is List)
        return map.map((item) => Provinsi.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Provinsi?> getProvinsi(int id) async {
    final response = await get('provinsi/$id');
    return response.body;
  }

  Future<Response<Provinsi>> postProvinsi(Provinsi provinsi) async =>
      await post('provinsi', provinsi);
  Future<Response> deleteProvinsi(int id) async => await delete('provinsi/$id');
}
