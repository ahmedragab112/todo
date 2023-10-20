import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/shared/network/firebase/firebase_manger.dart';
import 'package:todo/shared/styles/colors/colors.dart';
import 'package:todo/shared/widgets/tasks_filed.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController taskTitleController = TextEditingController();

  final TextEditingController taskdescriptionController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.addNewTask,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          TaskFiled(
            controller: taskTitleController,
            labelText: AppLocalizations.of(context)!.title,
            hintText: AppLocalizations.of(context)!.enterTitle,
          ),
          SizedBox(
            height: 20.h,
          ),
          TaskFiled(
            controller: taskdescriptionController,
            labelText: AppLocalizations.of(context)!.taskDescription,
            hintText: AppLocalizations.of(context)!.enterTaskDescription,
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Text(
              AppLocalizations.of(context)!.selectTime,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            selectedDate.toString().substring(0, 10),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primryColorLight),
            onPressed: () {
              FirebaseManger.addTask(
                TaskModel(
                  date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
                  description: taskdescriptionController.text,
                  title: taskTitleController.text,
                ),
              );
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'The task have been added',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primryColorLight),
                      onPressed: () {
                        Navigator.pop(context);
                        taskTitleController.clear();
                        taskdescriptionController.clear();
                      },
                      child: Text(
                        'Add another task',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        taskTitleController.clear();
                        taskdescriptionController.clear();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancle',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  ],
                ),
              );
            },
            child: Text(
              AppLocalizations.of(context)!.addNewTask,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  void selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.primryColorLight,
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ),
          child: child!,
        );
      },
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (chosenDate == null) {
      return;
    }
    selectedDate = chosenDate;
    setState(() {});
  }
}
