class LoginModel {
  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  int userId;

  LoginModel(
      {this.accessToken='',
      this.encryptedAccessToken='',
      this.expireInSeconds=-1,
      this.userId=-1});

  LoginModel fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken']??'';
    encryptedAccessToken = json['encryptedAccessToken']??'';
    expireInSeconds = json['expireInSeconds']??-1;
    userId = json['userId']??-1;

    return LoginModel(
      accessToken: accessToken,
      encryptedAccessToken: encryptedAccessToken,
      userId: userId,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['encryptedAccessToken'] = encryptedAccessToken;
    data['expireInSeconds'] = expireInSeconds;
    data['userId'] = userId;
    return data;
  }
}
