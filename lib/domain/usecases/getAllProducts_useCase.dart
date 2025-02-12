
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/getAllProduct_remote_dataSource.dart';
import 'package:injectable/injectable.dart';

import '../../core/failures.dart';


@injectable
class GetAllProductsUseCase {
  GetAllProductRemoteDatasource getAllProductRemoteDatasource;


  GetAllProductsUseCase(this.getAllProductRemoteDatasource);

  Future<Either<Failures, GetAllProductsEntity>> invoke (String categoryID)async{
    return await getAllProductRemoteDatasource.getAllProductByCategory(categoryID);
  }
}