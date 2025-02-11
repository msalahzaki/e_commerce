import 'package:e_commerce/domain/entities/LoginEntity.dart';


class LoginStates {}

class LoginLoadingState extends  LoginStates{}
class LoginInitialState extends  LoginStates{}
class  LoginErrorState extends  LoginStates{
  String errorMassage;

  LoginErrorState(this.errorMassage);
}
class  LoginSuccessState extends  LoginStates{
   LoginEntity loginEntity;

   LoginSuccessState(this.loginEntity);
}