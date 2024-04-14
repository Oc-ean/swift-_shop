import 'package:flutter/material.dart';
import 'package:swift_shop/constants/colors.dart';
// import 'package:st_tech/utils/colors.dart';

class AddToCartButton extends StatelessWidget {
  final String text;
  final String priceText;
  const AddToCartButton(
      {super.key, required this.text, required this.priceText});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: addToCartButton,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text(
            priceText,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
