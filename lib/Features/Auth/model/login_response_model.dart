class LoginResponseModel {
  final String accesstoken;
 final String  refreshtoken;

  LoginResponseModel({
    required this.accesstoken,
    required this.refreshtoken,
  });
LoginResponseModel.fromJson(Map<String, dynamic> json)
      : accesstoken = json['access_token'],
        refreshtoken = json['refresh_token'];
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['access_token'] = accesstoken;
  data['refresh_token'] = refreshtoken;
  return data;
}
}
