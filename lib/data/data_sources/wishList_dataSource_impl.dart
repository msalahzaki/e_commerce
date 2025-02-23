import 'package:dartz/dartz.dart';
import 'package:e_commerce/api/api_manger.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/core/shared_preference_utils.dart';
import 'package:e_commerce/data/model/AddToCartResponseModel.dart';
import 'package:e_commerce/data/model/GetCardResponseModel.dart';
import 'package:e_commerce/data/model/GetWishListResponseModel.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/cart_dataSource.dart';
import 'package:e_commerce/domain/repositories/dataSource/wishList_dataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:WishListDataSource)
class WishListDataSourceImpl extends WishListDataSource{
  ApiManger apiManger;

  WishListDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failures, GetWishListResponseModel>> getWishList() async{
    try {
      String token = SharedPreferenceUtils.getData(key: "token").toString();
      var response = await apiManger
          .getData(endpoint: EndPoints.wishlist,headers: {"token":token}
      );

      GetWishListResponseModel wishListResponse =
      GetWishListResponseModel.fromJson(response!.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(wishListResponse);
      }
      else {
        return Left(ServerError(errorMessage: wishListResponse.message!));
      }
    }
    catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }


}