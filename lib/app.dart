import 'package:amicta/shared/theme.dart';
import 'package:amicta/ui/pages/customer/bottom_navigation_bar.dart';
import 'package:amicta/ui/pages/customer/customer_home_page.dart';
import 'package:amicta/ui/pages/customer/onboarding_page.dart';
import 'package:amicta/ui/pages/customer/sign_in_page.dart';
import 'package:amicta/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(
              //color: blackColor,
              ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashPage()),
        GetPage(name: '/onboarding', page: () => OnboardingPage()),
        GetPage(name: '/customer-sign-in', page: () => SignInPage()),
        GetPage(name: '/customer-bottom-navbar', page: () => BottomNavBar()),
        GetPage(name: '/customer-home', page: () => const CustomerHomePage()),
      ],
    );
  }
}
