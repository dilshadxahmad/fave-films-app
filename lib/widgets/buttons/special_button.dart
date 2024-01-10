import 'package:fave_films/utils/constants/app_colors.dart';
import 'package:fave_films/utils/constants/app_constants.dart';
import 'package:fave_films/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const SpecialButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      width: 65.h,
      child: TextButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          overlayColor: MaterialStatePropertyAll(AppColors.primaryBlue),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppConstants.assetImagesUrl + AppImages.iconButtonBG,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
