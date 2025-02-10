import 'package:e_commerce/domain/entities/RegisterEntity.dart';

class RegisterStates {}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  String errorMassage;

  RegisterErrorState(this.errorMassage);
}
class RegisterSuccessState extends RegisterStates{
  RegisterEntity registerEntity;

  RegisterSuccessState(this.registerEntity);
}