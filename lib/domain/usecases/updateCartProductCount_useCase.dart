import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCartProductCountUseCase {
  CartRepository cartRepository;

  UpdateCartProductCountUseCase(this.cartRepository);

  Future<Either<Failures,GetCardResponseEntity>> invoke (String newCount,String productID){

   return cartRepository.updateProductCount(newCount, productID);

  }
}