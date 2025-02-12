import 'package:dartz/dartz.dart';
import 'package:e_commerce/api/api_manger.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/data/model/AllCategoriesResponseModel.dart';
import 'package:e_commerce/data/model/GetAllProductsModel.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';

import 'package:e_commerce/domain/repositories/dataSource/getAllCategories_remote_dataSource.dart';
import 'package:e_commerce/domain/repositories/dataSource/getAllProduct_remote_dataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllProductRemoteDatasource)
class GetAllProductsRemoteDatasourceImpl extends GetAllProductRemoteDatasource {
  ApiManger apiManger;

  GetAllProductsRemoteDatasourceImpl(this.apiManger);

  @override
  Future<Either<Failures, GetAllProductsModel>> getAllProductByCategory(String categoryID) async{
   // try{
      var response = await apiManger.getData(endpoint: EndPoints.getALLProducts,queryParameters: {
        "category[_id]":categoryID
      });

      GetAllProductsModel getAllProductsModel =
      GetAllProductsModel.fromJson(response!.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(getAllProductsModel);
      } else {
        return Left(ServerError(errorMessage: "categoriesResponseModel.message"));
      }
    //
    // }
    // catch (e) {
    //
    //   return Left(Failures(errorMessage: e.toString()));
    //
    // }


  }


  }




