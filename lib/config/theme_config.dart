import 'package:fave_films/utils/constants/app_colors.dart';
import 'package:fave_films/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeConfig {
  static ThemeData lightTheme() {
    return ThemeData.light();
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.black,
      fontFamily: AppConstants.poppinsFont,
      highlightColor: AppColors.white.withOpacity(0.1),

      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.white,
      ),
      iconTheme: IconThemeData(
        color: AppColors.black,
        size: 36.h,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          fill: 0,
          color: AppColors.white,
          size: 24.sp,
        ),
        titleTextStyle: TextStyle(
          fontSize: 22.sp,
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.w700,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.white,
          size: 24.sp,
        ),
        backgroundColor: AppColors.black,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 8.w,
        centerTitle: false,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primaryBlue,
        linearTrackColor: AppColors.primaryBlue.withOpacity(0.25),
      ),

      chipTheme: ChipThemeData(
        disabledColor: Colors.transparent,
        selectedColor: AppColors.primaryBlue,
        shape: const StadiumBorder(
          side: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        showCheckmark: false,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.lightGrey,
        ),
      ),

      ///////////////////////
      /// Buttons' Themes ///
      ///////////////////////

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.primaryBlue.withOpacity(0);
              }
              return AppColors.primaryBlue;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.white.withOpacity(0.25);
              }
              return AppColors.black;
            },
          ),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          overlayColor:
              MaterialStatePropertyAll(AppColors.white.withOpacity(0.1)),
          shadowColor:
              MaterialStatePropertyAll(AppColors.primaryBlue.withOpacity(0.1)),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return 0;
              }
              return 8.sp;
            },
          ),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: const MaterialStatePropertyAll(AppColors.black),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          overlayColor:
              MaterialStatePropertyAll(AppColors.white.withOpacity(0.1)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              const MaterialStatePropertyAll(AppColors.primaryBlue),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          side: const MaterialStatePropertyAll(
            BorderSide(color: AppColors.primaryBlue),
          ),
          overlayColor:
              MaterialStatePropertyAll(AppColors.primaryBlue.withOpacity(0.1)),
          elevation: const MaterialStatePropertyAll(0),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconSize: const MaterialStatePropertyAll(24),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          foregroundColor:
              const MaterialStatePropertyAll(AppColors.primaryBlue),
          overlayColor:
              MaterialStatePropertyAll(AppColors.primaryBlue.withOpacity(0.1)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.transparent,
                width: 0.8.h,
              ),
              borderRadius: BorderRadius.circular(13.r),
            ),
          ),
        ),
      ),

      ///////////////////////
      /// Other Themes ///
      ///////////////////////

      dividerTheme: DividerThemeData(
        color: AppColors.grey,
        thickness: 0.5.h,
      ),
      cardTheme: CardTheme(
        color: AppColors.grey,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.grey.withOpacity(0.1),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        focusElevation: 0,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: AppColors.primaryBlue,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(8.r),
        ),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.primaryBlue,
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.all(8.h),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.black,
        surfaceTintColor: Colors.transparent,
        width: 200.w,
        shape: const LinearBorder(),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primaryBlue.withOpacity(0.3),
        contentTextStyle: const TextStyle(color: AppColors.white),
        behavior: SnackBarBehavior.floating,
        width: 176.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
        filled: true,
        fillColor: AppColors.grey.withOpacity(0.25),
        labelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
          color: AppColors.white,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
          color: AppColors.white,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryBlue,
        selectionHandleColor: AppColors.primaryBlue,
        selectionColor: AppColors.primaryBlue.withOpacity(0.1),
      ),

      ///////////////////////
      /// Text Themes ///////
      ///////////////////////

      textTheme: TextTheme(
        /// Display Styles
        displayLarge: TextStyle(
          color: AppColors.white,
          fontSize: 23.sp,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        displaySmall: TextStyle(
          color: AppColors.lightGrey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w100,
          height: 1.75,
        ),

        /// Label Styles
        labelLarge: TextStyle(
          color: AppColors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),

        ////////////////////////////////////////////////
        displayMedium: TextStyle(
          color: AppColors.primaryBlue,
          fontSize: 32.sp,
        ),

        // Body Styles
        bodyLarge: TextStyle(
          color: AppColors.primaryBlue,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: AppColors.primaryBlue,
          fontSize: 16.sp,
        ),
        bodySmall: TextStyle(
          color: AppColors.primaryBlue,
          fontSize: 14.sp,
          fontFamily: AppConstants.poppinsFont,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
        ),

        // Headline Styles
        headlineMedium: TextStyle(
          color: AppColors.white,
          fontSize: 14.sp,
        ),
        headlineSmall: TextStyle(
          color: AppColors.primaryBlue,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
