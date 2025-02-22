import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  CartRepository cartRepository;

  AddToCartUseCase(this.cartRepository);

  Future<Either<Failures,AddToCartResponseEntity>> invoke (String productId){

   return cartRepository.addToCart(productId);

  }
}