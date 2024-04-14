import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swift_shop/views/cart/screens/cart_screen.dart';
import 'package:swift_shop/views/home/screens/home_screen.dart';

import 'constants/images.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List pages = [
    const HomeScreen(),
    const CartScreen(),
    Container(
      child: Center(
        child: Text('Profile'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: WillPopScope(
        onWillPop: () async {
          if (_currentIndex > 0) {
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
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
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.white,
              onTap: (index) {
                print('Index is : $index');
                if (mounted) {
                  setState(() {
                    // _currentIndex = index;
                    if (index == 1) {
                      _showModalBottomSheet(context);
                    } else {
                      _currentIndex = index;
                    }
                  });
                }
              },
              backgroundColor: const Color(0xFF000034),
              // activeColor: Colors.grey,
              // height: 55,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _currentIndex == 0 ? homeFillIcon : homeIcon,
                    height: 27,
                    width: 27,
                    color: _currentIndex == 0 ? Colors.indigo : Colors.white,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _currentIndex == 1 ? bagFillIcon : bagIcon,
                      height: 27,
                      width: 27,
                      color: _currentIndex == 1 ? Colors.indigo : Colors.white,
                    ),
                    label: 'Carts'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _currentIndex == 2 ? userFillIcon : userIcon,
                      height: 26,
                      width: 26,
                      color: _currentIndex == 2 ? Colors.indigo : Colors.white,
                    ),
                    label: 'Profile'),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: pages[_currentIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      enableDrag: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => const CartScreen(),
    );
  }
}
