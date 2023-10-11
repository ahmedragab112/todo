import 'package:flutter/material.dart';
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
        margin: const EdgeInsets.only(left: 20),
        height: 50,
        width: 319,
        decoration: BoxDecoration(
            color: Colors.white,
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