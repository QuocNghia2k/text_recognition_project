class UserModel {
  final String? id;
  final String? email;
  final String? phoneNumber;
  final String? name;
  final String? urlProfile;

  UserModel(
      {this.id, this.name, this.email, this.phoneNumber, this.urlProfile});

  UserModel copyWith(
      {String? id,
      String? email,
      String? name,
      String? phoneNumber,
      String? urlProfile}) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        urlProfile: urlProfile ?? this.urlProfile);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['urlProfile'] = this.urlProfile;
    return data;
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        phoneNumber: map['phoneNumber'],
        urlProfile: map['urlProfile']);
  }
}
