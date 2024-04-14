import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class CartTile extends StatefulWidget {
  final ProductModel productModel;

  const CartTile({
    super.key,
    required this.productModel,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 82,
            width: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF7A60A5),
                  Color(0xFF101010),
                  // Color(0xFF82C3DF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [
                  0.0,
                  1.0,
                ],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.productModel.image),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productModel.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${widget.productModel.price}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF6E4E)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: 27,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                count.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    count--;
                  });
                },
                child: const Icon(
                  CupertinoIcons.minus,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          const Center(
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
