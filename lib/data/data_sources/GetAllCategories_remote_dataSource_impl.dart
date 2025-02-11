import 'package:dartz/dartz.dart';
import 'package:e_commerce/api/api_manger.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/data/model/AllCategoriesResponseModel.dart';

import 'package:e_commerce/domain/repositories/dataSource/getAllCategories_remote_dataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllCategoriesRemoteDatasource)
class GetAllCategoriesRemoteDatasourceImpl extends GetAllCategoriesRemoteDatasource {
  ApiManger apiManger;

  GetAllCategoriesRemoteDatasourceImpl(this.apiManger);

  @override
  Future<Either<Failures, AllCategoriesResponseModel>> getAllCategories() async{
 try{
    var response = await apiManger.getData(endpoint: EndPoints.getAllCategories);
    print(response!.data);
    AllCategoriesResponseModel categoriesResponseModel =
    AllCategoriesResponseModel.fromJson(response.data);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Right(categoriesResponseModel);
    } else {
      return Left(ServerError(errorMessage: "categoriesResponseModel.message"));
    }

} catch (e) {
return Left(Failures(errorMessage: e.toString()));
}
}
  }




