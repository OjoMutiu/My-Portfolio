class UserModel {
  int? id;
  String? name;
  String? email;
  String? resumeUrl;
  // String? linkedlnUrl;
  // String? resumeUrl;
  String? role;

  UserModel(
      {
        this.id,
        this.name,
        this.email,
        this.resumeUrl,
        this.role,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }if (json["resumeUrl"] is String) {
      resumeUrl = json["resumeUrl"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }if (json["email"] is String) {
      email = json["email"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["resumeUrl"] = resumeUrl;
    data["name"] = name;
    data["email"] = email;
    data["role"] = role;
    return data;
  }
}
