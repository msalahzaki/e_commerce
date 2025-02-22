import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';

class AddToCartResponseModel extends AddToCartResponseEntity{
  AddToCartResponseModel({
      super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data,});

  AddToCartResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
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
    product = json['product'];
    price = json['price'];
  }
  num? count;
  String? id;
  String? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}