import 'package:dartz/dartz.dart';
import 'package:e_commerce/api/api_manger.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/core/shared_preference_utils.dart';
import 'package:e_commerce/data/model/AddToCartResponseModel.dart';
import 'package:e_commerce/data/model/GetCardResponseModel.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/cart_dataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:CartDatasource)
class CartDatasourceImpl extends CartDatasource{
  ApiManger apiManger;

  CartDatasourceImpl(this.apiManger);

  @override
  Future<Either<Failures, AddToCartResponseModel>> addToCart(String productId) async{
   try {
     String token = SharedPreferenceUtils.getData(key: "token").toString();
     var response = await apiManger
         .postData(endpoint: EndPoints.cart, body: {
       "productId": productId
     },headers: {"token":token}
     );

     AddToCartResponseModel addToCartResponseModel =
     AddToCartResponseModel.fromJson(response!.data);

     if (response.statusCode! >= 200 && response.statusCode! < 300) {
       return Right(addToCartResponseModel);
     }
     else {
       return Left(ServerError(errorMessage: addToCartResponseModel.message!));
     }
   }
 catch (e) {
return Left(Failures(errorMessage: e.toString()));
}



  }

  @override
  Future<Either<Failures, GetCardResponseModel>> getCart() async{
    try {
      String token = SharedPreferenceUtils.getData(key: "token").toString();
      var response = await apiManger
          .getData(endpoint: EndPoints.cart
      ,headers: {"token":token}
      );

      GetCardResponseModel getCardResponseModel =
      GetCardResponseModel.fromJson(response!.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(getCardResponseModel);
      }
      else {
        return Left(ServerError(errorMessage: getCardResponseModel.message!));
      }
    }
    catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCardResponseEntity>> updateProductCount(String newCount,String productID) async{
    try {
      String token = SharedPreferenceUtils.getData(key: "token").toString();
      var response = await apiManger
          .updateData( "${EndPoints.cart}/$productID"
          ,headers: {"token":token},body: {"count" : newCount}
      );

      GetCardResponseModel getCardResponseModel =
      GetCardResponseModel.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(getCardResponseModel);
      }
      else {
        return Left(ServerError(errorMessage: getCardResponseModel.message!));
      }
    }
    catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }


}