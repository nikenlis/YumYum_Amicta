import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amicta/shared/theme.dart';

class SearchController extends GetxController {
  var searchQuery = ''.obs;
}

class CustomSearchBar extends StatelessWidget {
  final double width;
  final SearchController controller = Get.put(SearchController());
  final String search;

  CustomSearchBar({
    super.key,
    required this.search,
    this.width = 275,
  });

  @override
  Widget build(BuildContext context) {
    controller.searchQuery.value = search;
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: greyColor),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search_outlined,
            color: greyColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Obx(
            () => Text(
              controller.searchQuery.value,
              style: greyTextStyle.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
