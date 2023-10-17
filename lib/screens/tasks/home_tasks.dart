import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';
import 'package:todo/shared/network/firebase/firebase_manger.dart';
import 'package:todo/shared/styles/colors/colors.dart';
import 'package:todo/shared/widgets/task_item.dart';

class TaskesTab extends StatefulWidget {
  const TaskesTab({super.key});

  @override
  State<TaskesTab> createState() => _TaskesTabState();
}

class _TaskesTabState extends State<TaskesTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate = date;
              setState(() {});
            },
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
        StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirebaseManger.getTasks(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SliverToBoxAdapter(
                  child: Center(child: Text("Something went wrong")));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            List<TaskModel> tasks =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return SliverList.builder(
              itemBuilder: (context, index) => TaskItem(
                task: tasks[index],
              ),
              itemCount: tasks.length,
            );
          },
        )
      ],
    );
  }
}
