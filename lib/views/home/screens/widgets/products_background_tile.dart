import 'package:flutter/material.dart';

class ProductBackgroundTile extends StatelessWidget {
  final dynamic productModel;
  final dynamic productImage;
  const ProductBackgroundTile(
      {super.key, required this.productModel, this.productImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.black,
        image: DecorationImage(
          image: NetworkImage(productImage),
          fit: BoxFit.cover,
        ),
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
    );
  }
}
