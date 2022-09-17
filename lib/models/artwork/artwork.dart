// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:art_wld/utils/math.dart';
import '../user.dart';

class Artwork {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? imgUrl;
  String? thumbnail;
  int? price;
  User? user;

  Artwork({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.imgUrl,
    this.thumbnail,
    this.user,
  }) {
    price = Math.random(10000, 150000);
  }

  @override
  String toString() {
    return 'Artwork(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, imgUrl: $imgUrl, user: $user)';
  }

  Artwork copyWith({
    String? id,
    String? createdAt,
    String? updatedAt,
    String? description,
    String? imgUrl,
    String? thumbnail,
    User? user,
  }) {
    return Artwork(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      thumbnail: thumbnail ?? this.thumbnail,
      user: user ?? this.user,
    );
  }

  factory Artwork.fromMap(Map<String, dynamic> map) {
    return Artwork(
      id: map['id'] != null ? map['id'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      imgUrl: map['imgUrl'] ??
          (map['urls']['regular'] != null
              ? map['urls']['regular'] as String
              : null),
      thumbnail: map['thumbnail'] ??
          (map['urls']['thumb'] != null
              ? map['urls']['thumb'] as String
              : null),
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  factory Artwork.fromJson(String source) =>
      Artwork.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Artwork other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.description == description &&
        other.imgUrl == imgUrl &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        description.hashCode ^
        imgUrl.hashCode ^
        user.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'description': description,
      'imgUrl': imgUrl,
      'thumbnail': thumbnail,
      'user': user?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}
