import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final bool isLoading;
  final Color? backgroundColor;
  const PrimaryButton({
    required this.onPressed,
    required this.child,
    this.width,
    this.isLoading = false,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 36.h,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ElevatedButton(
              onPressed: onPressed,
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStatePropertyAll(backgroundColor),
                  ),
              child: child,
            ),
    );
  }
}
