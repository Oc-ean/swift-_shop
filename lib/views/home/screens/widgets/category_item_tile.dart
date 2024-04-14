import 'package:flutter/material.dart';

import '../../../../models/category_item_model.dart';

class CategoryItemTile extends StatelessWidget {
  final Color color;
  final CategoryItemModel categoryItemModel;
  const CategoryItemTile(
      {super.key, required this.color, required this.categoryItemModel});

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
            tag: 'category_${categoryItemModel.id}',
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(categoryItemModel.itemImage!),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high)),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                '\$${categoryItemModel.itemPrice}0',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${categoryItemModel.itemName}.',
                maxLines: 1,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
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
