import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swift_shop/views/home/screens/widgets/add_to_cart_button.dart';
import 'package:swift_shop/views/home/screens/widgets/products_background_tile.dart';
import 'package:swift_shop/views/home/screens/widgets/select_color_tile.dart';
import 'package:swift_shop/views/home/screens/widgets/size_tile.dart';

import '../../../constants/images.dart';
import '../../../constants/strings.dart';
import '../../cart/screens/cart_screen.dart';

class ProductDetails extends StatefulWidget {
  final dynamic productModel;
  final String? productName;
  final String? productImage;
  final String? productDetails;
  final int? productPrice;
  final String productTag;
  final dynamic listItem;
  const ProductDetails({
    super.key,
    required this.productModel,
    this.productName,
    this.productDetails,
    this.productPrice,
    required this.productTag,
    this.productImage,
    this.listItem,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? selected;
  MyColorItem? colorSelected;

  // List<MyItem> items = [
  //   MyItem(
  //     id: 1,
  //     title: 'S',
  //   ),
  //   MyItem(
  //     id: 2,
  //     title: 'M',
  //   ),
  //   MyItem(
  //     id: 3,
  //     title: 'L',
  //   ),
  //   MyItem(
  //     id: 4,
  //     title: 'XL',
  //   ),
  //   MyItem(
  //     id: 5,
  //     title: 'XXL',
  //   ),
  // ];

  List<MyColorItem> colorItem = [
    MyColorItem(
      id: 1,
      color: const Color(0xFF1A1B20),
    ),
    MyColorItem(
      id: 2,
      color: const Color(0xFFCA1305),
    ),
    MyColorItem(
      id: 3,
      color: const Color(0xFFC4B5AE),
    ),
    MyColorItem(
      id: 4,
      color: const Color(0xFFFFD5DF),
    ),
    MyColorItem(
      id: 5,
      color: const Color(0xFFD4EEEB),
    ),
  ];

  void selectItem(dynamic item) {
    if (selected == item) {
      selected = null;
    } else {
      selected = item;
    }
    setState(() {});
  }

  void selectColorItem(MyColorItem colorItem) {
    if (colorSelected == colorItem) {
      colorSelected = null;
    } else {
      colorSelected = colorItem;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 37,
            width: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF010035),
            ),
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CartScreen(),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFF6E4E),
              ),
              child: Center(
                child: SvgPicture.asset(
                  bagIcon,
                  color: Colors.white,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.productTag,
                child: ProductBackgroundTile(
                  productModel: widget.productModel,
                  productImage: widget.productImage,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${widget.productName}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const SizedBox(
                        height: 45,
                        width: 45,
                        child: Card(
                          shape: CircleBorder(),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.heart,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${widget.productDetails}.',
                  maxLines: 11,
                  style: const TextStyle(
                    fontSize: 15,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Visibility(
                  visible: widget.listItem != widget.listItem,
                  child: const Text(
                    'Size : ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                width: 16,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    if (widget.listItem == 'Clothes')
                      ...items.map((item) {
                        return ReusableSizeContainer(
                          item: item,
                          isSelected: selected == item,
                          onItemTapped: () {
                            selectItem(item);
                          },
                        );
                      }).toList(),
                    if (widget.listItem == 'Sneakers')
                      ...shoeSize.map((item) {
                        return ReusableSizeContainer(
                          item: item,
                          isSelected: selected == item,
                          onItemTapped: () {
                            selectItem(item);
                          },
                        );
                      }).toList(),
                    if (widget.listItem == 'Glasses')
                      ...glassSize.map((item) {
                        return ReusableSizeContainer(
                          item: item,
                          isSelected: selected == item,
                          onItemTapped: () {
                            selectItem(item);
                          },
                        );
                      }).toList(),
                    if (widget.listItem == 'Watches')
                      ...watchSize.map((item) {
                        return ReusableSizeContainer(
                          item: item,
                          isSelected: selected == item,
                          onItemTapped: () {
                            selectItem(item);
                          },
                        );
                      }).toList()
                  ],
                ),
              ),

              // DropDownColorTile(),

              const SizedBox(
                height: 12,
              ),
              Visibility(
                visible: widget.listItem != 'Watches',
                child: const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Color : ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Visibility(
                visible: widget.listItem != 'Watches',
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    children: colorItem.map((item) {
                      return ReusableColorContainer(
                        item: item,
                        isSelected: colorSelected == item,
                        onItemTapped: () {
                          selectColorItem(item);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 27,
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 16.0,
          right: 16.0,
          left: 16.0,
        ),
        child: AddToCartButton(
          text: 'Add to cart ',
          priceText: '\$${widget.productPrice}.00',
        ),
      ),
    );
  }
}
