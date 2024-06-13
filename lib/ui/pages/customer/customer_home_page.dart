import 'package:amicta/shared/theme.dart';
import 'package:amicta/ui/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            buildProfile(context),
            buildSearchBar(context),
          ],
        ),
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                'Niken Lismiati',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/img_profile.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchBar(
              search: '',
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Icon(
            Icons.favorite_outline,
            size: 25,
          ),
        ],
      ),
    );
  }
}
