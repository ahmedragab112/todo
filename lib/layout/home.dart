import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/screens/settings/setting_tab.dart';
import 'package:todo/screens/tasks/home_tasks.dart';
import 'package:todo/shared/styles/colors/colors.dart';
import 'package:todo/shared/widgets/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> pages = const [TaskesTab(), SettingTab()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              index == 0
                  ? AppLocalizations.of(context)!.todo
                  : AppLocalizations.of(context)!.setting,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
        body: pages[index],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.error,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          iconSize: 20.h,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Icon awesome-list.png'),
              ),
              label: 'Taskes',
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/setting.png'),
                ),
                label: 'Setting'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 100,
        focusColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 3.w,
          ),
        ),
        backgroundColor: AppColor.primryColorLight,
        onPressed: () {
          showAddTasks();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  void showAddTasks() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      )),
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddTaskBottomSheet(),
      ),
    );
  }
}
