import 'package:flutter/material.dart';
import 'package:swift_shop/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  final Color color;
  const ProductTile(
      {super.key, required this.productModel, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Hero(
            tag: 'product_${productModel.id}',
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(productModel.image),
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high)),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  '\$${productModel.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  '\$${productModel.oldPrice}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    height: 2,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Container(
            height: 25,
            child: Center(
              child: Text(
                productModel.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          // SizedBox(
          //   height: 45,
          //   width: 135,
          //   child: OutlinedButton(
          //     style: OutlinedButton.styleFrom(),
          //     onPressed: () {},
          //     child: const Text('Add'),
          //   ),
          // )
        ],
      ),
    );
  }
}
