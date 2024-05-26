// To parse this JSON data, do
//
//     final detailSurah = detailSurahFromJson(jsonString);

import 'dart:convert';

DetailSurah detailSurahFromJson(String str) =>
    DetailSurah.fromJson(json.decode(str));

String detailSurahToJson(DetailSurah data) => json.encode(data.toJson());

class DetailSurah {
  int? code;
  String? message;
  Surah? data;

  DetailSurah({
    this.code,
    this.message,
    this.data,
  });

  factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Surah.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Surah {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  Map<String, String>? audioFull;
  List<Ayat>? ayat;
  SuratSenya? suratSelanjutnya;
  SuratSenya? suratSebelumnya;

  Surah({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        ayat: json["ayat"] == null
            ? []
            : List<Ayat>.from(json["ayat"]!.map((x) => Ayat.fromJson(x))),
        suratSelanjutnya: json["suratSelanjutnya"] == null
            ? null
            : SuratSenya.fromJson(json["suratSelanjutnya"]),
        suratSebelumnya: json["suratSebelumnya"] == false
            ? null
            : SuratSenya.fromJson(json["suratSebelumnya"]),
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": ayat == null
            ? []
            : List<dynamic>.from(ayat!.map((x) => x.toJson())),
        "suratSelanjutnya": suratSelanjutnya?.toJson(),
        "suratSebelumnya": suratSebelumnya?.toJson(),
      };
}

class Ayat {
  int? nomorAyat;
  String? teksArab;
  String? teksLatin;
  String? teksIndonesia;
  Map<String, String>? audio;
  bool? isPlay;

  Ayat(
      {this.nomorAyat,
      this.teksArab,
      this.teksLatin,
      this.teksIndonesia,
      this.audio,
      this.isPlay});

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
      nomorAyat: json["nomorAyat"],
      teksArab: json["teksArab"],
      teksLatin: json["teksLatin"],
      teksIndonesia: json["teksIndonesia"],
      audio: Map.from(json["audio"]!)
          .map((k, v) => MapEntry<String, String>(k, v)),
      isPlay: false);

  Map<String, dynamic> toJson() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "isPlay": isPlay,
        "audio":
            Map.from(audio!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class SuratSenya {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;

  SuratSenya({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
  });

  factory SuratSenya.fromJson(Map<String, dynamic> json) => SuratSenya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };
}
