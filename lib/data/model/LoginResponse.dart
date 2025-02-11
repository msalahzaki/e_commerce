import 'package:e_commerce/data/model/RegisterDataModel.dart';
import 'package:e_commerce/domain/entities/LoginEntity.dart';


/// message : "success"
/// user : {"name":"Mohamed Salah","email":"msalahz@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YWIzNjM3ZmE3ODk1ZTgxZjdhOTkxYyIsIm5hbWUiOiJNb2hhbWVkIFNhbGFoIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzkyNzM4MDMsImV4cCI6MTc0NzA0OTgwM30.nuoJUITO1-OIJ8WZEy1GohNxIR3J5UmiPYXCv5io0i4"

class LoginResponse extends LoginEntity{
  LoginResponse({
      super.message,
      super.user,
      super.token,
    this.statusMsg
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

String? statusMsg ;

}
