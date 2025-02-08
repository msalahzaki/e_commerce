import 'package:e_commerce/domain/entities/RegisterEntity.dart';

/// message : "success"
/// statusMsg : "fail"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttii4048@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTdiZjZlZmE3ODk1ZTgxZjJiYjFjYyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5MDQ2NzY3LCJleHAiOjE3NDY4MjI3Njd9.sG7szSzJqJzQEj7wapusY6KSCcncuviLdnzMvc2caAs"

class RegisterDataModel extends RegisterEntity{
  RegisterDataModel({
      super.message,
    super.statusMsg,
    super.user,
    super.token,});

  RegisterDataModel.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDataModel.fromJson(json['user']) : null;
    token = json['token'];
  }



}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii4048@gmail.com"
/// role : "user"

class UserDataModel extends UserEntity{
  UserDataModel({
      super.name,
    super.email,
      this.role,});

  UserDataModel.fromJson(dynamic json) {

    name = json['name'];
    role = json['email'];
    role = json['role'];
  }

  String? role;



}