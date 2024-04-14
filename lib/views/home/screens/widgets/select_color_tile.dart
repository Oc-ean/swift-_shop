import 'package:flutter/material.dart';

class ReusableColorContainer extends StatelessWidget {
  final MyColorItem item;
  final bool isSelected;
  final VoidCallback onItemTapped;

  ReusableColorContainer(
      {required this.item,
      required this.onItemTapped,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final containerColor = isSelected ? Colors.blue : const Color(0xFFFEFEFE);
    final selectedColor = isSelected ? item.color : Colors.black38;

    return GestureDetector(
      onTap: onItemTapped,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selectedColor, width: 2.5),
        ),
        alignment: Alignment.center,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: item.color,
            // border: Border.all(color: selectedColor, width: 2),
          ),
        ),
      ),
    );
  }
}

class MyColorItem {
  final int id;
  final Color color;

  MyColorItem({
    required this.id,
    required this.color,
  });
}
