class Provinsi {
  String? provinceId;
  String? province;

  Provinsi({this.provinceId, this.province});

  Provinsi.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['province_id'] = provinceId;
    data['province'] = province;
    return data;
  }

  static List<Provinsi> fromJsonLIst(List data) {
    if (data == null || data.length == null) return [];
    return data.map((e) => Provinsi.fromJson(e)).toList();
  }
}
