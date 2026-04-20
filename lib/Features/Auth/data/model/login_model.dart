
class LoginModel {
  String? accessToken;
  String? expiresAtUtc;
  String? refreshToken;

  LoginModel({this.accessToken, this.expiresAtUtc, this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if(json["accessToken"] is String) {
      accessToken = json["accessToken"];
    }
    if(json["expiresAtUtc"] is String) {
      expiresAtUtc = json["expiresAtUtc"];
    }
    if(json["refreshToken"] is String) {
      refreshToken = json["refreshToken"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["accessToken"] = accessToken;
    data["expiresAtUtc"] = expiresAtUtc;
    data["refreshToken"] = refreshToken;
    return data;
  }
}