import 'package:fave_films/res/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GeneralExceptionWidget extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  final bool isLoading;
  const GeneralExceptionWidget({
    required this.message,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Theme.of(context).colorScheme.error,
          ),
          SizedBox(height: 30.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          SizedBox(height: 30.h),
          PrimaryButton(
            onPressed: onPressed,
            isLoading: isLoading,
            backgroundColor: Theme.of(context).colorScheme.error,
            child: Text('retry'.tr),
          ),
        ],
      ),
    );
  }
}
