import 'package:hive/hive.dart';
import 'package:swift_shop/models/category_model.dart';

part 'category_item_model.g.dart';

@HiveType(typeId: 2)
class CategoryItemModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final CategoryModel category;
  @HiveField(2)
  final String itemName;
  @HiveField(3)
  final String itemImage;
  @HiveField(4)
  final double itemPrice;
  @HiveField(5)
  final String itemDescription;

  CategoryItemModel({
    required this.id,
    required this.category,
    required this.itemName,
    required this.itemImage,
    required this.itemPrice,
    required this.itemDescription,
  });

  // Factory constructor to parse JSON
  factory CategoryItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemModel(
      id: json['_id'],
      category: CategoryModel.fromJson(json['category']),
      itemName: json['itemName'],
      itemImage: json['itemImage'],
      itemPrice: json['itemPrice'].toDouble(),
      itemDescription: json['itemDescription'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['itemName'] = itemName;
    data['itemImage'] = itemImage;
    data['itemPrice'] = itemPrice;
    data['itemDescription'] = itemDescription;
    return data;
  }
}

// class CategoryItemModel {
//   String? id;
//   String? category;
//   String? itemName;
//   String? itemImage;
//   int? itemPrice;
//   String? itemDescription;
//
//   CategoryItemModel(
//       {this.id,
//         this.category,
//         this.itemName,
//         this.itemImage,
//         this.itemPrice,
//         this.itemDescription});
//
//   CategoryItemModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     category = json['category'];
//     itemName = json['itemName'];
//     itemImage = json['itemImage'];
//     itemPrice = json['itemPrice'];
//     itemDescription = json['itemDescription'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category'] = this.category;
//     data['itemName'] = this.itemName;
//     data['itemImage'] = this.itemImage;
//     data['itemPrice'] = this.itemPrice;
//     data['itemDescription'] = this.itemDescription;
//     return data;
//   }
// }
