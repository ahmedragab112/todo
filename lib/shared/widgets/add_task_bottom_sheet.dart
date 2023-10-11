import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors/colors.dart';
import 'package:todo/shared/widgets/tasks_filed.dart';

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
            'Add New Task',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.primryColorLight),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          TaskFiled(
            controller: taskTitleController,
            labelText: 'Title',
            hintText: 'Enter Task Title',
          ),
          const SizedBox(
            height: 20,
          ),
          TaskFiled(
            controller: taskdescriptionController,
            labelText: 'Description',
            hintText: 'Enter Task Description',
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Text(
              'Select time',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.primryColorLight),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            selectedDate.toString().substring(0, 10),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primryColorLight),
            onPressed: () {},
            child: Text(
              'Add Task',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {},
            child: Text(
              'Delete Task',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ));
    if (chosenDate == null) {
      return;
    }
    selectedDate = chosenDate;
    setState(() {});
  }
}
