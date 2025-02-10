
import 'package:e_commerce/domain/entities/RegisterEntity.dart';

class RegisterDataModel extends RegisterEntity {
  RegisterDataModel({
    super.message,
    super.user,
    this.statusMsg,
    super.token,
  });

  RegisterDataModel.fromJson(dynamic json) {


    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
    statusMsg = json['statusMsg'];
  }

  String? statusMsg;
}

class UserModel extends UserEntity {
  UserModel({
    super.name,
    super.email,
    this.role,
  });

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
