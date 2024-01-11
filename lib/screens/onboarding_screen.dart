import 'package:fave_films/screens/home_screen.dart';
import 'package:fave_films/utils/constants/app_constants.dart';
import 'package:fave_films/utils/constants/app_images.dart';
import 'package:fave_films/widgets/buttons/special_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(16.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppConstants.assetImagesUrl +
                AppImages.onboardingScreenIllustration),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Your Rocketship into the Adventurous World of Films.",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              "Continue and explore the top rated movies, curate your favorites list and more.",
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            SpecialButton(
              onPressed: () {
                Get.to(() => const HomeScreen());
              },
              child: const Icon(Icons.chevron_right_rounded),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
