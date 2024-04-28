// To parse this JSON data, do
//
//     final quranSurah = quranSurahFromJson(jsonString);

import 'dart:convert';

QuranSurah quranSurahFromJson(String str) => QuranSurah.fromJson(json.decode(str));

String quranSurahToJson(QuranSurah data) => json.encode(data.toJson());

class QuranSurah {
    int? code;
    String? message;
    List<Surah>? data;

    QuranSurah({
        this.code,
        this.message,
        this.data,
    });

    factory QuranSurah.fromJson(Map<String, dynamic> json) => QuranSurah(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Surah>.from(json["data"]!.map((x) => Surah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Surah {
    int? nomor;
    String? nama;
    String? namaLatin;
    int? jumlahAyat;
    TempatTurun? tempatTurun;
    String? arti;
    String? deskripsi;
    Map<String, String>? audioFull;

    Surah({
        this.nomor,
        this.nama,
        this.namaLatin,
        this.jumlahAyat,
        this.tempatTurun,
        this.arti,
        this.deskripsi,
        this.audioFull,
    });

    factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: tempatTurunValues.map[json["tempatTurun"]]!,
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurunValues.reverse[tempatTurun],
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

enum TempatTurun {
    MADINAH,
    MEKAH
}

final tempatTurunValues = EnumValues({
    "Madinah": TempatTurun.MADINAH,
    "Mekah": TempatTurun.MEKAH
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
