import 'package:fave_films/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieCardWidget extends StatelessWidget {
  final String title;
  final String backgroundImage;
  final String releasedDate;
  final String imdbRating;
  final Widget overlayButton;
  const MovieCardWidget({
    required this.title,
    required this.backgroundImage,
    required this.releasedDate,
    required this.imdbRating,
    required this.overlayButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, bottom: 16.w),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 195.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: NetworkImage(
                        backgroundImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 195.h,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x30000000),
                        Color(0x00000000),
                        Color(0x00000000),
                        Color(0x30000000),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 4.h,
                  right: 4.w,
                  child: overlayButton,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${'released'.tr} : ',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.lightGrey,
                        fontSize: 12.sp,
                      ),
                ),
                Text(
                  releasedDate,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: AppColors.white,
              ),
              child: Text(
                '★ $imdbRating IMDb',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
