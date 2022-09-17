import 'dart:convert';

class ProfileImage {
  String? small;

  ProfileImage({this.small});

  @override
  String toString() => 'ProfileImage(small: $small)';

  factory ProfileImage.fromMap(Map<String, dynamic> data) => ProfileImage(
        small: data['small'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'small': small,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileImage].
  factory ProfileImage.fromJson(String data) {
    return ProfileImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileImage] to a JSON string.
  String toJson() => json.encode(toMap());

  ProfileImage copyWith({
    String? small,
  }) {
    return ProfileImage(
      small: small ?? this.small,
    );
  }
}
