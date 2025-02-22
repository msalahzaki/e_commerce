import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/cart_dataSource.dart';
import 'package:e_commerce/domain/repositories/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:CartRepository)
class CartRepositoryImpl extends CartRepository{

  CartDatasource cartDatasource;

  CartRepositoryImpl(this.cartDatasource);

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId) {
 return cartDatasource.addToCart(productId);
  }

  @override
  Future<Either<Failures, GetCardResponseEntity>> getCart() {
   return cartDatasource.getCart();
  }

  @override
  Future<Either<Failures, GetCardResponseEntity>> updateProductCount(String newCount,String productID) {
   return cartDatasource.updateProductCount(newCount,productID);
  }

}