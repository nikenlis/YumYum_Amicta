import 'package:amicta/shared/share_method.dart';
import 'package:amicta/shared/theme.dart';
import 'package:amicta/ui/widgets/bottons.dart';
import 'package:amicta/ui/widgets/form.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 50,
                margin: const EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img_logo.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 155,
                height: 50,
                margin: const EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img_logo_name.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Sign In to Your\nAccount',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: EMAIL INPUT
                CustomFormField(
                  title: 'Email Address',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: PASSWORD INPUT
                CustomFormField(
                  title: 'Password',
                  controller: passwordController,
                  iconVisibility: true,
                  isShowTitle: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Sign In',
                  onPressed: () {
                    if (validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/customer-bottom-navbar', (route) => false);
                    } else {
                      showCustomSnackbar(context, 'Semua Field Harus diIsi');
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
