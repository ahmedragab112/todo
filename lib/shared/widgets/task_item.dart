import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/shared/styles/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(20),
      child: Container(
        height: 115.h,
        width: 352.w,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(
              15,
            ),
            border: Border.all(
              color: Colors.transparent,
            )),
        child: Row(
          children: [
            const VerticalDivider(
              thickness: 4,
              color: AppColor.primryColorLight,
            ),
             SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 AppLocalizations.of(context)!.taskTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColor.primryColorLight),
                ),
                Text(
                  AppLocalizations.of(context)!.taskDescription,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColor.primryColorLight),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 10.w,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                     SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '10:30',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primryColorLight,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.transparent))),
              onPressed: () {},
              child: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
