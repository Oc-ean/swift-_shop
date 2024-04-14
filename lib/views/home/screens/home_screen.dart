import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_shop/view_model/category/category_provider.dart';
import 'package:swift_shop/views/home/screens/category_item_screen.dart';
import 'package:swift_shop/views/home/screens/product_details_screen.dart';
import 'package:swift_shop/views/home/screens/widgets/product_tile.dart';
import 'package:swift_shop/views/home/screens/widgets/sales_card.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../models/product_model.dart';
import 'widgets/reusable_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getCategories();
    super.initState();
  }

  void getCategories() {
    Provider.of<CategoryProvider>(context, listen: false).fetchCategory();
    Provider.of<CategoryProvider>(context, listen: false).fetchCategoryFromDb();
  }

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryProvider>(
      context,
    ).category;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color(0xFFF8F8F8),
        title: const Row(
          children: [
            Text(
              'Swift',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: 0.5,
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Shop',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.indigo,
                letterSpacing: 0.5,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          // InkWell(
          //   onTap: () {},
          //   child: const Icon(
          //     Icons.search,
          //     color: Colors.black,
          //   ),
          // ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ListView(
            children: [
              const Text(
                'Hot sales',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const SaleCard();
                  },
                  autoplay: true,
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        size: 5,
                        activeSize: 7,
                        color: Colors.white,
                        activeColor: Colors.indigo),
                  ),
                  // control: const SwiperControl(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {},
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  // padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...List.generate(
                            category.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ReusableCategory(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            CategoryItemScreen(
                                          title: category[index].name,
                                          categoryId: category[index].id,
                                        ),
                                      ),
                                    );
                                    print('Category Id ${category[index].id}');
                                  },
                                  image: category[index].image,
                                  text: category[index].name),
                            ),
                          ),
                        ],
                      ),
                      // ReusableCategory(
                      //     image: 'assets/fast_food.png', text: 'Fast food'),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // ReusableCategory(
                      //     image: 'assets/sneakers.png', text: 'Sneakers'),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // ReusableCategory(
                      //     image: 'assets/watch.png', text: 'Watch'),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // ReusableCategory(
                      //     image: 'assets/cloth.png', text: 'Clothes'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Best Seller',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              if (bestSales.isEmpty)
                const Center(
                  child: Text('Best sales is empty'),
                )
              else
                GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shrinkWrap: true,
                    itemCount: bestSales.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 7.0,
                      childAspectRatio: 0.7,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      ProductModel products = bestSales[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ProductDetails(
                                productModel: products,
                                productName: products.name,
                                productDetails: products.description,
                                productPrice: products.price,
                                productTag: 'product_${products.id}',
                                productImage: products.image,
                              ),
                            ),
                          );
                        },
                        child: ProductTile(
                          productModel: products,
                          color: colors[index % bestSales.length],
                        ),
                      );
                    })
            ],
          ),
          //     const Text(
          //       'Shopify',
          //       style:
          //           TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
          //     ),
          //     const SizedBox(
          //       height: 20.0,
          //     ),
          //     Container(
          //       height: 40,
          //       width: 350,
          //       padding: const EdgeInsets.only(left: 10.0),
          //       decoration: BoxDecoration(
          //         color: Colors.grey.shade300,
          //         borderRadius: BorderRadius.circular(23),
          //       ),
          //       child: TextFormField(
          //         keyboardType: TextInputType.visiblePassword,
          //         decoration: const InputDecoration(
          //           suffixIcon: Icon(
          //             Icons.search,
          //           ),
          //           hintText: 'Search',
          //           border: InputBorder.none,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 15.0,
          //     ),
          //     Text(
          //       'Categories',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 19,
          //           color: Colors.grey.shade500),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: const SingleChildScrollView(
          //         clipBehavior: Clip.none,
          //         // padding: EdgeInsets.zero,
          //         scrollDirection: Axis.horizontal,
          //         child: Row(
          //           children: [
          //             ReusableCategory(
          //                 image: 'assets/fast_food.png',
          //                 text: 'Fast food'),
          //             ReusableCategory(
          //                 image: 'assets/sneakers.png', text: 'Sneakers'),
          //             ReusableCategory(
          //                 image: 'assets/watch.png', text: 'Watch'),
          //             ReusableCategory(
          //                 image: 'assets/cloth.png', text: 'Clothes'),
          //           ],
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 15.0,
          //     ),
          //     Text(
          //       'Best sales',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 19,
          //           color: Colors.grey.shade500),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     productLists.isEmpty
          //         ? const Center(
          //             child: Text('Best sales is empty'),
          //           )
          //         : GridView.builder(
          //             padding: EdgeInsets.zero,
          //             physics: const NeverScrollableScrollPhysics(),
          //             clipBehavior: Clip.antiAliasWithSaveLayer,
          //             shrinkWrap: true,
          //             itemCount: productLists.length,
          //             gridDelegate:
          //                 const SliverGridDelegateWithFixedCrossAxisCount(
          //                     mainAxisSpacing: 20.0,
          //                     crossAxisSpacing: 20.0,
          //                     childAspectRatio: 0.7,
          //                     crossAxisCount: 2),
          //             itemBuilder: (context, index) {
          //               ProductModel products = productLists[index];
          //               return Card(
          //                 elevation: 8.0,
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(15.0),
          //                 ),
          //                 child: Column(
          //                   children: [
          //                     const SizedBox(
          //                       height: 10.0,
          //                     ),
          //                     Container(
          //                       height: 100,
          //                       width: 120,
          //                       decoration: BoxDecoration(
          //                           color: colors[
          //                               index % productLists.length],
          //                           borderRadius:
          //                               BorderRadius.circular(12),
          //                           image: DecorationImage(
          //                               image:
          //                                   NetworkImage(products.image),
          //                               fit: BoxFit.contain,
          //                               filterQuality:
          //                                   FilterQuality.high)),
          //                     ),
          //                     const SizedBox(
          //                       height: 10.0,
          //                     ),
          //                     Container(
          //                       height: 25,
          //                       child: Center(
          //                         child: Text(
          //                           products.name,
          //                           style: const TextStyle(
          //                               fontWeight: FontWeight.w500,
          //                               fontSize: 15,
          //                               overflow: TextOverflow.ellipsis),
          //                         ),
          //                       ),
          //                     ),
          //                     const SizedBox(
          //                       height: 4.0,
          //                     ),
          //                     Text('Price \$${products.price}'),
          //                     const SizedBox(
          //                       height: 10.0,
          //                     ),
          //                     SizedBox(
          //                       height: 45,
          //                       width: 135,
          //                       child: OutlinedButton(
          //                         style: OutlinedButton.styleFrom(),
          //                         onPressed: () {},
          //                         child: const Text('Add'),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               );
          //             })
          //   ],
          // ),
        ),
      ),
      extendBody: true,
    );
  }
}
