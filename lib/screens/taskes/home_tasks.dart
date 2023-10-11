import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';
import 'package:todo/shared/styles/colors/colors.dart';
import 'package:todo/shared/widgets/task_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskesTab extends StatelessWidget {
  const TaskesTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: AppColor.primryColorLight,
          dayColor: Theme.of(context).colorScheme.secondary,
          activeDayColor: Theme.of(context).colorScheme.onPrimary,
          activeBackgroundDayColor: Theme.of(context).colorScheme.secondary,
          dotsColor: Theme.of(context).colorScheme.onPrimary,
          selectableDayPredicate: (date) => true,
          locale: provider.languageCode,
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
