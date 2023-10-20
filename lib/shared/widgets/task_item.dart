import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/screens/edittasks/edit_task.dart';
import 'package:todo/screens/task_details/task_details.dart';
import 'package:todo/shared/network/firebase/firebase_manger.dart';
import 'package:todo/shared/styles/colors/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
  final TaskModel task;

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
      child: Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseManger.deleteTask(task.id);
            },
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskPage(task: task),
                  ));
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ]),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetails(task: task),
                ));
          },
          child: Container(
            height: 115.h,
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
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        task.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColor.primryColorLight),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        task.description,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColor.primryColorLight,
                            ),
                        maxLines: 2,
                      ),
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
                          DateTime.fromMillisecondsSinceEpoch(task.date)
                              .toString()
                              .substring(0, 10),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
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
                      backgroundColor: task.isDone == true
                          ? Colors.green
                          : AppColor.primryColorLight,
                      elevation: task.isDone == true ? 0 : 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.transparent))),
                  onPressed: () {
                    task.isDone = true;
                    FirebaseManger.update(task);
                  },
                  child: task.isDone == true
                      ? Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        )
                      : const Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
