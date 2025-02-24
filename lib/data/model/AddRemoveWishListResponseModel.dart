

import 'package:e_commerce/domain/entities/AddRemoveWishListResponseEntity.dart';

class AddRemoveWishListResponseModel extends AddRemoveWishListResponseEntity{
  AddRemoveWishListResponseModel({
      super.statusMsg,
    super.status,
    super.message,
    super.productsIDs,});

  AddRemoveWishListResponseModel.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    status = json['status'];
    message = json['message'];
    productsIDs = json['data'] != null ? json['data'].cast<String>() : [];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['status'] = status;
    map['message'] = message;
    map['data'] = productsIDs;
    return map;
  }

}