// To parse this JSON data, do
//
//     final listBerita = listBeritaFromJson(jsonString);

import 'dart:convert';

ListBerita listBeritaFromJson(String str) => ListBerita.fromJson(json.decode(str));

String listBeritaToJson(ListBerita data) => json.encode(data.toJson());

class ListBerita {
    bool? success;
    dynamic message;
    Berita? data;

    ListBerita({
        this.success,
        this.message,
        this.data,
    });

    factory ListBerita.fromJson(Map<String, dynamic> json) => ListBerita(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Berita.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Berita {
    String? link;
    String? description;
    String? title;
    String? image;
    List<Post>? posts;

    Berita({
        this.link,
        this.description,
        this.title,
        this.image,
        this.posts,
    });

    factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        link: json["link"],
        description: json["description"],
        title: json["title"],
        image: json["image"],
        posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "description": description,
        "title": title,
        "image": image,
        "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
    };
}

class Post {
    String? link;
    String? title;
    DateTime? pubDate;
    String? description;
    String? thumbnail;

    Post({
        this.link,
        this.title,
        this.pubDate,
        this.description,
        this.thumbnail,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        link: json["link"],
        title: json["title"],
        pubDate: json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
        description: json["description"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "title": title,
        "pubDate": pubDate?.toIso8601String(),
        "description": description,
        "thumbnail": thumbnail,
    };
}
