import 'package:amicta/shared/theme.dart';
import 'package:amicta/ui/pages/customer/customer_home_page.dart';
import 'package:amicta/ui/pages/customer/customer_merchant_page.dart';
import 'package:amicta/ui/pages/customer/customer_order_page.dart';
import 'package:amicta/ui/pages/customer/customer_profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  //final controller =
  final List<Widget> pages = [
    const CustomerHomePage(),
    const CustomerMerchantPage(),
    const CustomerOrderPage(),
    const CustomerProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          height: 80,
          elevation: 0,
          indicatorColor: lightGreyColor,
          selectedIndex: currentPageIndex,
          destinations: [
            NavigationDestination(
                icon: const Icon(Icons.home_outlined), label: 'Home', selectedIcon: Icon(Icons.home_outlined, color: purpleColor,),),
            const NavigationDestination(
                icon: Icon(Icons.shop_outlined), label: 'Merchant'),
            const NavigationDestination(
                icon: Icon(Icons.list_outlined), label: 'Order'),
            const NavigationDestination(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ]),
      body: pages[currentPageIndex],
    );
  }
}
