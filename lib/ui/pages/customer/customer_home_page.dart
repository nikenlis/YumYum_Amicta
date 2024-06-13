import 'package:amicta/shared/theme.dart';
import 'package:amicta/ui/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              )
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
                      image: AssetImage('assets/img_profile.png'))),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: const Row(
        children: [
          Expanded(child: CustomSearchBar(search: 'What are you craving?')),
          SizedBox(width: 12,),
          Icon(Icons.favorite_outline, size: 25,)

        ],
      ),
    );
  }







  Widget buildSearchBar2(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 20,
      width: 100,
      color: Colors.amber,
      child: Row(
        children: [
          Container(
            width: 275,
            height: 51,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: greyColor)

            ),
          )
        ],
      ),
    );
  }
}
