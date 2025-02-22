import 'package:e_commerce/data/model/ProductModel.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';

class GetCardResponseModel extends GetCardResponseEntity{
  GetCardResponseModel({
      super.status,
      super.numOfCartItems,
      super.cartId,
      super.data,
  this.message
  });
String? message;
  GetCardResponseModel.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    message = json['message'];
    data = json['data'] != null ? CartDataModel.fromJson(json['data']) : null;
  }

}

class CartDataModel extends CartDataEntity{
  CartDataModel({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  CartDataModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProductsModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


}

class CartProductsModel extends CartProductsEntity{
  CartProductsModel({
      super.count,
      super.id,
      super.product,
      super.price,});

  CartProductsModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? ProductDataModel.fromJson(json['product']) : null;
    price = json['price'];
  }



}
