import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';

class GetCardStates {}
class GetCardLoadingState extends GetCardStates{}
class UpdateProductCountState extends GetCardStates{
  String productID;

  UpdateProductCountState(this.productID);
}
class GetCardErrorState extends GetCardStates{
  String errorMessage;

  GetCardErrorState(this.errorMessage);
}
class GetCardSuccessState extends GetCardStates{
  GetCardResponseEntity getCardResponseEntity ;

  GetCardSuccessState(this.getCardResponseEntity);
}