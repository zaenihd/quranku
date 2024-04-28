// To parse this JSON data, do
//
//     final doaModel = doaModelFromJson(jsonString);

import 'dart:convert';

DoaModel doaModelFromJson(String str) => DoaModel.fromJson(json.decode(str));

String doaModelToJson(DoaModel data) => json.encode(data.toJson());

class DoaModel {
    List<ListDoa>? data;

    DoaModel({
        this.data,
    });

    factory DoaModel.fromJson(Map<String, dynamic> json) => DoaModel(
        data: json["data"] == null ? [] : List<ListDoa>.from(json["data"]!.map((x) => ListDoa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ListDoa {
    String? arab;
    String? indo;
    String? judul;
    String? source;

    ListDoa({
        this.arab,
        this.indo,
        this.judul,
        this.source,
    });

    factory ListDoa.fromJson(Map<String, dynamic> json) => ListDoa(
        arab: json["arab"],
        indo: json["indo"],
        judul: json["judul"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "arab": arab,
        "indo": indo,
        "judul": judul,
        "source": source,
    };
}
