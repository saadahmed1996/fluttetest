class UserModel {
  final String displayName;
  final String email;
  final String id;
  final String photoUrl;
  final String serverAuthCode;

  UserModel({
    this.displayName = "",
    this.email = "",
    this.id = "",
    this.photoUrl = "",
    this.serverAuthCode = "",
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        displayName: json["displayName"] ?? "",
        email: json["email"] ?? "",
        id: json["id"] ?? "",
        photoUrl: json["photoUrl"] ?? "",
        serverAuthCode: json["serverAuthCode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "email": email,
        "id": id,
        "photoUrl": photoUrl,
        "serverAuthCode": serverAuthCode,
      };
}
