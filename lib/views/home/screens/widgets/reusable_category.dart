import 'package:flutter/material.dart';

class ReusableCategory extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;
  const ReusableCategory(
      {Key? key,
      required this.image,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
            height: 71,
            width: 71,
            child: Card(
              color: Colors.white,
              elevation: 1.0,
              shape: const CircleBorder(),
              child: Center(
                child: Container(
                  height: 71,
                  width: 71,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
