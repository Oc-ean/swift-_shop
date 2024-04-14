class ProductModel {
  final String name;
  final String id;
  bool isFavourite;
  final String image;
  final dynamic oldPrice;
  final dynamic price;
  final String description;
  final String status;

  ProductModel(
      {required this.price,
      required this.oldPrice,
      required this.description,
      required this.status,
      required this.id,
      required this.image,
      required this.name,
      required this.isFavourite});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        isFavourite: false,
        image: json['image'],
        status: json['status'],
        oldPrice: json['oldPrice'],
        price: json['price'],
      );
  // price: double.parse(json['price'].toString()));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'status': status,
        'oldPrice': oldPrice,
        'price': price,
        'isFavourite': isFavourite,
      };
}
