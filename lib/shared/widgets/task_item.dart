import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors/colors.dart';

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
        height: 115,
        width: 352,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
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
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColor.primryColorLight),
                ),
                Text(
                  'Task description',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColor.primryColorLight),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '10:30',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.transparent))),
              onPressed: () {},
              child: const Icon(Icons.done),
            )
          ],
        ),
      ),
    );
  }
}
