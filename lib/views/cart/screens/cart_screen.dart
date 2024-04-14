import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_shop/views/cart/widgets/cart_tile.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../models/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double count = 0;

  double calculateTotalPrice(List<ProductModel> products) {
    double totalPrice = 0;
    for (var product in products) {
      totalPrice += product.price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice(bestSales);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
                child: GestureDetector(
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
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'My Cart',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 1.33,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF010035),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 35.0, right: 35.0, top: 35, bottom: 5),
                child: ListView.separated(
                  itemCount: bestSales.length,
                  separatorBuilder: (context, child) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemBuilder: (context, index) {
                    final products = bestSales[index];
                    return CartTile(
                      productModel: products,
                    );
                  },
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    totalPrice.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    'Delivery',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    'Free',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 50,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: addToCartButton,
              ),
              child: const Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
