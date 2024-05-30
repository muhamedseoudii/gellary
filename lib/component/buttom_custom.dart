import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_gellary/utils/app_text_styles.dart';

class FilledButtomEdit extends StatelessWidget {
  final String text;
  final Color color, color1;
  final double size;
  final FocusNode? focusNodes;
  final void Function()? onClick;

  const FilledButtomEdit(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      required this.color1,
      required this.onClick,
      this.focusNodes});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        focusNode: focusNodes,
        onPressed: onClick,
        style: FilledButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(330.w, 50.h),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color1,
              fontSize: size.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerButtonEdit extends StatelessWidget {
  final String text, icon;
  final Gradient? boxColor;
  final void Function()? onClick;

  const ContainerButtonEdit(
      {super.key,
      required this.text,
      required this.onClick,
      required this.icon,
      this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: onClick,
      child: Container(
        width: 140.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    gradient: boxColor),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Text(
                text,
                style: AppTextStyles.largeTitle16,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
