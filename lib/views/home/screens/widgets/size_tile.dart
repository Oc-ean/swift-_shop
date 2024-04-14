import 'package:flutter/material.dart';

class ReusableSizeContainer extends StatelessWidget {
  final dynamic item;
  final bool isSelected;
  final VoidCallback onItemTapped;

  ReusableSizeContainer(
      {required this.item,
      required this.onItemTapped,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final containerColor = isSelected ? Colors.blue : const Color(0xFFFEFEFE);
    final textColor = isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onItemTapped,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: containerColor,
          border: Border.all(color: Colors.grey.shade300),
        ),
        alignment: Alignment.center,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 12,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class MyItem {
  final int id;
  final String title;

  MyItem({
    required this.id,
    required this.title,
  });
}
