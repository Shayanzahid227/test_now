import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_now/core/constant/colors.dart';
import 'package:test_now/core/constant/text_style.dart';
import 'package:test_now/core/widgets/back_button.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,

    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,

      elevation: 0,
      centerTitle: false,
      leading: showBackButton
          ? Padding(
              padding: EdgeInsets.only(left: 25.0, top: 40.0),
              child: CustomBackButton(backgroundColor: whiteColor),
            )
          : const SizedBox(),
      title: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Text(title, style: style25B.copyWith(fontSize: 24.sp)),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
