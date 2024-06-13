import 'package:amicta/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormFieldController extends GetxController {
  var isObscure = true.obs;

  void toggleVisibility() {
    isObscure.value = !isObscure.value;
  }
}

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final bool iconVisibility;
  final Function(String)? onFieldSubmitted;

  CustomFormField({
    super.key,
    required this.title,
    this.obsecureText = false,
    this.controller,
    this.isShowTitle = true,
    this.iconVisibility = false,
    this.onFieldSubmitted,
  });

  final CustomFormFieldController _controller =
      Get.put(CustomFormFieldController());

  @override
  Widget build(BuildContext context) {
    _controller.isObscure.value = obsecureText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 8,
          ),
        Obx(
          () => TextFormField(
            obscureText: _controller.isObscure.value,
            controller: controller,
            decoration: InputDecoration(
              hintText: !isShowTitle ? title : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: const EdgeInsets.all(12),
              suffixIcon: iconVisibility
                  ? IconButton(
                      onPressed: () {
                        _controller.toggleVisibility();
                      },
                      icon: Icon(
                        _controller.isObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: greyColor,
                      ),
                    )
                  : null,
            ),
            onFieldSubmitted: onFieldSubmitted,
          ),
        ),
      ],
    );
  }
}
