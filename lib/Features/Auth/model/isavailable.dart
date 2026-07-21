class Isavailable {
  bool ?isavailable;
  Isavailable({this.isavailable});
  Isavailable.fromJson(Map<String, dynamic> json) {
    isavailable = json['isAvailable'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isAvailable'] = isavailable;
    return data;
  }
}