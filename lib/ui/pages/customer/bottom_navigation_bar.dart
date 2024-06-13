import 'package:amicta/shared/theme.dart';
import 'package:amicta/ui/pages/customer/customer_home_page.dart';
import 'package:amicta/ui/pages/customer/customer_merchant_page.dart';
import 'package:amicta/ui/pages/customer/customer_order_page.dart';
import 'package:amicta/ui/pages/customer/customer_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentPageIndex = 0.obs;

  void changePage(int index) {
    currentPageIndex.value = index;
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> pages = [
    const CustomerHomePage(),
    const CustomerMerchantPage(),
    const CustomerOrderPage(),
    const CustomerProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              navigationController.changePage(index);
            },
            height: 80,
            elevation: 0,
            indicatorColor: lightGreyColor,
            selectedIndex: navigationController.currentPageIndex.value,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                label: 'Home',
                selectedIcon: Icon(
                  Icons.home_outlined,
                  color: purpleColor,
                ),
              ),
              const NavigationDestination(
                  icon: Icon(Icons.shop_outlined), label: 'Merchant'),
              const NavigationDestination(
                  icon: Icon(Icons.list_outlined), label: 'Order'),
              const NavigationDestination(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ],
          ),
          body: pages[navigationController.currentPageIndex.value],
        ));
  }
}
