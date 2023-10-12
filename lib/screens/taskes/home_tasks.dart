import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';
import 'package:todo/shared/styles/colors/colors.dart';
import 'package:todo/shared/widgets/task_item.dart';

class TaskesTab extends StatelessWidget {
  const TaskesTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: AppColor.primryColorLight,
            dayColor: Theme.of(context).colorScheme.secondary,
            activeDayColor: Theme.of(context).colorScheme.onSecondary,
            activeBackgroundDayColor: Theme.of(context).colorScheme.secondary,
            dotsColor: Theme.of(context).colorScheme.onSecondary,
            selectableDayPredicate: (date) => true,
            locale: provider.languageCode,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(const [
            TaskItem(),
            TaskItem(),
            TaskItem(),
            TaskItem(),
            TaskItem(),
            TaskItem(),
          ]),
        ),
      ],
    );
  }
}
