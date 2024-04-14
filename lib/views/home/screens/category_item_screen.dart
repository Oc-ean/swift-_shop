import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_shop/constants/colors.dart';
import 'package:swift_shop/view_model/category_item/category_item_provider.dart';
import 'package:swift_shop/views/home/screens/product_details_screen.dart';
import 'package:swift_shop/views/home/screens/widgets/category_item_tile.dart';

class CategoryItemScreen extends StatefulWidget {
  final String title;
  final String categoryId;

  const CategoryItemScreen({
    Key? key,
    required this.title,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  @override
  void initState() {
    super.initState();
    // Call getItemCategories in initState using addPostFrameCallback
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getItemCategories();
    });
  }

  void getItemCategories() {
    Provider.of<CategoryItemProvider>(context, listen: false)
        .fetchCategory(widget.categoryId);
    // Provider.of<CategoryItemProvider>(context, listen: false)
    //     .fetchCategoriesFromDb();
    print('Widget id ${widget.categoryId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0.0,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<CategoryItemProvider>(
        builder: (context, categoryItemProvider, _) {
          if (categoryItemProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (categoryItemProvider.categoryItems.isEmpty) {
            return const Center(
              child: Text('No items found'),
            );
          } else {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shrinkWrap: true,
              itemCount: categoryItemProvider.categoryItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 7.0,
                childAspectRatio: 0.7,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final itemProduct = categoryItemProvider.categoryItems[index];
                print('Item : $itemProduct');
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProductDetails(
                          productModel: itemProduct,
                          productName: itemProduct.itemName,
                          productDetails: itemProduct.itemDescription,
                          productPrice: itemProduct.itemPrice.toInt(),
                          productTag: 'category_${itemProduct.id}',
                          productImage: itemProduct.itemImage,
                          listItem: widget.title,
                        ),
                      ),
                    );
                  },
                  child: CategoryItemTile(
                    color: colors[
                        index % categoryItemProvider.categoryItems.length],
                    categoryItemModel: itemProduct,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
