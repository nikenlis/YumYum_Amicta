import 'package:amicta/shared/theme.dart';
import 'package:amicta/ui/pages/home_page.dart';
import 'package:amicta/ui/pages/onboarding_page.dart';
import 'package:amicta/ui/pages/sign_in_page.dart';
import 'package:amicta/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      routes: {
        '/' : (context) => const SplashPage(),
        '/onboarding' :(context) => const OnboardingPage(),
        '/sign-in' :(context) => SignInPage(),
        '/home' :(context) => const HomePage()
      },
    );
  }
}