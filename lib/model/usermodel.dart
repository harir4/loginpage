class Userdetails {
  String? id;
  String? username;
  String? name;
  String? mobile;
  Userdetails({
    this.id,
    this.username,
    this.name,
    this.mobile,
  });
  Userdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    mobile = json['mobile'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['mobile'] = mobile;
    return data;
  }
}
