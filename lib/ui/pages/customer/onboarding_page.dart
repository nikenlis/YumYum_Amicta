import 'package:amicta/ui/widgets/bottons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < 2) {
      currentIndex.value++;
    }
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  final List<String> titles = [
    'Welcome to Our App!',
    'Discover New Features',
    'Start Your Journey'
  ];

  final List<String> subtitles = [
    'Explore and enjoy the features we offer.',
    'Get to know the latest updates and tools.',
    'Join us now and start using our services.'
  ];

  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CarouselSlider(
              items: [
                Image.asset(
                  'assets/img_onboarding1.png',
                  height: 331,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/img_onboarding2.png',
                  height: 331,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/img_onboarding3.png',
                  height: 331,
                  fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  controller.updateIndex(index);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Obx(() => Text(
                      titles[controller.currentIndex.value],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(height: 26),
                Obx(() => Text(
                      subtitles[controller.currentIndex.value],
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(height: 40),
                Obx(() {
                  if (controller.currentIndex.value == 2) {
                    return Column(
                      children: [
                        CustomFilledButton(
                          title: 'Sign-in',
                          onPressed: () {
                            Get.offNamed('/customer-sign-in');
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(3, (index) {
                            return IndicatorDot(
                              isActive: controller.currentIndex.value == index,
                            );
                          }),
                        ),
                        CustomFilledButton(
                          title: 'Continue',
                          width: 150,
                          onPressed: controller.nextPage,
                        ),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  const IndicatorDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.purple : Colors.grey,
      ),
    );
  }
}
