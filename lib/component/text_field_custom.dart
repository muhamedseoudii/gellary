import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TextFieldCustomEdit extends StatelessWidget {
  final String? hintText, labelText;
  final TextEditingController controller;
  final String validatorText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final Color? fillColor;
  final TextStyle? style;
  final void Function()? onTap;
  final bool readOnly;

  const TextFieldCustomEdit(
      {super.key,
      this.hintText,
      required this.controller,
      required this.validatorText,
      this.textInputType,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines,
      this.labelText,
      this.fillColor,
      this.style,
      this.onTap,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines,
      style: style,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: 1,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(color: Color(0xffBDBDBD)),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorText;
        }
        return null;
      },
    );
  }
}

class TextFieldEditPass extends StatelessWidget {
  final String? hintText, labelText;
  final Widget? prefixIcon;
  final void Function()? onClick;
  final TextEditingController textController;
  final Widget icon;
  final bool obscureText;
  final Color? fillColor;
  final TextStyle? style;

  const TextFieldEditPass(
      {super.key,
      this.hintText,
      required this.onClick,
      required this.textController,
      required this.icon,
      required this.obscureText,
      this.labelText,
      this.prefixIcon,
      this.fillColor,
      this.style});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: TextInputType.visiblePassword,
      style: style,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        fillColor: fillColor,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: icon,
          onPressed: onClick,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          borderSide: const BorderSide(color: Color(0xffBDBDBD)),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter a password';
        } else if ((value?.length ?? 0) < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}

class TextFieldEditPassConfirm extends StatelessWidget {
  final String hintText;
  final void Function()? onClick;
  final TextEditingController textController;
  final Widget icon;
  final bool obscureText;
  final Widget? prefixIcon;
  final TextEditingController validateController;

  const TextFieldEditPassConfirm(
      {super.key,
      required this.hintText,
      required this.onClick,
      required this.textController,
      required this.icon,
      required this.obscureText,
      required this.validateController,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: TextInputType.visiblePassword,
      // style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: icon,
          onPressed: onClick,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffBDBDBD)),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'please enter a password'.tr;
        } else if ((value?.length ?? 0) < 6) {
          return 'password must be at least 6 characters'.tr;
        } else if (value != validateController.text) {
          return "both password doesn't match".tr;
        }
        return null;
      },
    );
  }
}

class SearchTextField extends StatelessWidget {
  final String image;
  final TextEditingController controller;
  final String hintText;
  final void Function()? onClick;
  final void Function(String)? onChange;

  const SearchTextField(
      {super.key,
      required this.image,
      required this.hintText,
      this.onClick,
      required this.controller,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: 1,
        prefixIcon: SvgPicture.asset(image, fit: BoxFit.scaleDown),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: onClick,
        ),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : const Color(0xffF5F5F5),
          ),
        ),
      ),
    );
  }
}

class CommentTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const CommentTextField(
      {super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: 1,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xffE0E0E0)),
        ),
      ),
    );
  }
}

class TextFieldNumberEdit extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const TextFieldNumberEdit({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: 1,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xffF5F5F5)),
        ),
      ),
    );
  }
}
