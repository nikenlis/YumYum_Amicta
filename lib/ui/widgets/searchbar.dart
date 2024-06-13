import 'package:amicta/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String search;
  final double width;
  const CustomSearchBar( {
    required this.search,
    this.width = 275,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: greyColor)
      ),
      child: Row(
        children: [
          Icon(Icons.search_outlined, color: greyColor,),
          const SizedBox(width: 10,),
          Text(search, style: greyTextStyle.copyWith(),)
        ],
      ),
    );
  }
}