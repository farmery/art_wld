import 'dart:convert';
import 'artwork/profile_image.dart';

class User {
  String? id;
  String? username;
  String? name;
  ProfileImage? profileImage;

  User({this.id, this.username, this.name, this.profileImage});

  @override
  String toString() {
    return 'User(id: $id, username: $username, name: $name, profileImage: $profileImage)';
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as String?,
        username: data['username'] as String?,
        name: data['name'] as String?,
        profileImage: data['profile_image'] == null
            ? null
            : ProfileImage.fromMap(
                data['profile_image'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'username': username,
        'name': name,
        'profile_image': profileImage?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    String? id,
    String? username,
    String? name,
    ProfileImage? profileImage,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
