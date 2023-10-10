import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors/colors.dart';
import 'package:todo/shared/widgets/task_item.dart';

class TaskesTab extends StatelessWidget {
  const TaskesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: AppColor.primryColorLight,
          dayColor: Colors.grey,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: AppColor.primryColorLight,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
            children: const [
              TaskItem(),
              TaskItem(),
              TaskItem(),
            ],
          ),
        ),
      ],
    );
  }
}
