import 'package:swift_shop/models/category_item_model.dart';

import 'product_model.dart';
import 'user_model.dart';

class CartItem {
  final String? id;
  final CategoryItemModel? item;
  final ProductModel? product;
  final int quantity;

  CartItem({
    this.id,
    this.item,
    this.product,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['_id'],
      item: json['itemId'] != null
          ? CategoryItemModel.fromJson(json['itemId'])
          : null,
      product: json['productId'] != null
          ? ProductModel.fromJson(json['productId'])
          : null,
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': item?.toJson(),
      'productId': product?.toJson(),
      'quantity': quantity,
    };
  }
}

class Cart {
  final UserModel user;
  final List<CartItem> items;

  Cart({
    required this.user,
    required this.items,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      user: UserModel.fromJson(json['userId']),
      items: (json['items'] as List<dynamic>)
          .map((itemJson) => CartItem.fromJson(itemJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': user.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}
