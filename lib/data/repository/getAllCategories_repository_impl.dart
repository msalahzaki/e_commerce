import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/entities/LoginEntity.dart';
import 'package:e_commerce/domain/entities/RegisterEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/auth_remote_dataSource.dart';
import 'package:e_commerce/domain/repositories/dataSource/getAllCategories_remote_dataSource.dart';
import 'package:e_commerce/domain/repositories/repository/auth_repository.dart';
import 'package:e_commerce/domain/repositories/repository/getAllCategories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : GetAllCategoriesRepository)
class GetAllCategoriesRepositoryImpl extends GetAllCategoriesRepository{
GetAllCategoriesRemoteDatasource getAllCategoriesRemoteDatasource;
  @override
  Future<Either<Failures, AllCategoriesEntity>> getAllCategories() {
    return getAllCategoriesRemoteDatasource.getAllCategories();
  }

GetAllCategoriesRepositoryImpl(this.getAllCategoriesRemoteDatasource);
}