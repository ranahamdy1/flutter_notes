import '../domain/login_entities.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.points,
    required super.credit,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    image: json['image'],
    points: json['points'],
    credit: json['credit'],
    token: json['token'],
  );
}

class LoginModel {
  final bool? status;
  final String? message;
  final UserModel? user;

  LoginModel({
    required this.status,
    required this.message,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json['status'],
    message: json['message'],
    user: json['data'] != null ? UserModel.fromJson(json['data']) : null,
  );
}
