import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/data/model/GetAllProductsModel.dart';
import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';
import 'package:e_commerce/domain/entities/LoginEntity.dart';
import 'package:e_commerce/domain/entities/RegisterEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/auth_remote_dataSource.dart';
import 'package:e_commerce/domain/repositories/dataSource/getAllCategories_remote_dataSource.dart';
import 'package:e_commerce/domain/repositories/dataSource/getAllProduct_remote_dataSource.dart';
import 'package:e_commerce/domain/repositories/repository/auth_repository.dart';
import 'package:e_commerce/domain/repositories/repository/getAllCategories_repository.dart';
import 'package:e_commerce/domain/repositories/repository/getAllProduct_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : GetAllProductRepository)
class GetAllProductsRepositoryImpl extends GetAllProductRepository{
GetAllProductRemoteDatasource  getAllProductRemoteDatasource;

GetAllProductsRepositoryImpl(this.getAllProductRemoteDatasource);

  @override
  Future<Either<Failures, GetAllProductsEntity>> getAllProductByCategory(String categoryID) async {
    return getAllProductRemoteDatasource.getAllProductByCategory(categoryID);
  }


}