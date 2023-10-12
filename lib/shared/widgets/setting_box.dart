import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/shared/styles/colors/colors.dart';

class SettingBox extends StatelessWidget {
  const SettingBox({super.key, required this.text, required this.function});
  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(left: 20.w),
        height: 50.h,
        width: 319.w,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.all(color: AppColor.primryColorLight, width: 2),
            shape: BoxShape.rectangle),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.primryColorLight),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: AppColor.primryColorLight,
          )
        ]),
      ),
    );
  }
}
