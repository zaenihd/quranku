// To parse this JSON data, do
//
//     final dzikirPagi = dzikirPagiFromJson(jsonString);

import 'dart:convert';

DzikirPagi dzikirPagiFromJson(String str) => DzikirPagi.fromJson(json.decode(str));

String dzikirPagiToJson(DzikirPagi data) => json.encode(data.toJson());

class DzikirPagi {
    List<DataDzikir>? data;

    DzikirPagi({
        this.data,
    });

    factory DzikirPagi.fromJson(Map<String, dynamic> json) => DzikirPagi(
        data: json["data"] == null ? [] : List<DataDzikir>.from(json["data"]!.map((x) => DataDzikir.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DataDzikir {
    String? arab;
    String? indo;
    Type? type;
    String? ulang;

    DataDzikir({
        this.arab,
        this.indo,
        this.type,
        this.ulang,
    });

    factory DataDzikir.fromJson(Map<String, dynamic> json) => DataDzikir(
        arab: json["arab"],
        indo: json["indo"],
        type: typeValues.map[json["type"]]!,
        ulang: json["ulang"],
    );

    Map<String, dynamic> toJson() => {
        "arab": arab,
        "indo": indo,
        "type": typeValues.reverse[type],
        "ulang": ulang,
    };
}

enum Type {
    PAGI
}

final typeValues = EnumValues({
    "pagi": Type.PAGI
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
