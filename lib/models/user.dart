class User {
  User({this.name});

  String name;

  /// Similar to Java:
  ///
  /// public static User fromJson(Map<String, dynamic> json);
  ///
  /// User user = User.fromJson(map);
  ///
  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] ?? null,
      );

  Map<String, dynamic> toJson() => {"name": name};
}
