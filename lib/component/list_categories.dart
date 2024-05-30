import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gellary/utils/app_text_styles.dart';

class ListCategoriesComponent extends StatelessWidget {
  final String text;
  final String image;

  const ListCategoriesComponent({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25.r,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}

class ListFamousPlacesComponent extends StatelessWidget {
  final String image;

  const ListFamousPlacesComponent({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.fill,
          width: 285.w,
          height: 170.h,
        ),
      ],
    );
  }
}

class RecommendedPlacesComponent extends StatelessWidget {
  final String title;
  final String desc;
  final String image;

  const RecommendedPlacesComponent({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          child: Image.network(
            image,
            fit: BoxFit.fill,
            width: 152.w,
            height: 87.h,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          title,
          style: AppTextStyles.largeTitle16,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 152.w,
          child: Text(
            desc,
            style: AppTextStyles.mediumGreyTitle14,
          ),
        ),
      ],
    );
  }
}

class RecommendedPlacesAllComponent extends StatelessWidget {
  final String title;
  final String desc;
  final String image;

  const RecommendedPlacesAllComponent({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
            child: Image.network(
              image,
              fit: BoxFit.fill,
              width: 300.w,
              height: 120.h,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          title,
          style: AppTextStyles.largeTitle16,
        ),
        SizedBox(height: 10.h),
        Text(
          desc,
          style: AppTextStyles.mediumGreyTitle14,
        ),
      ],
    );
  }
}
