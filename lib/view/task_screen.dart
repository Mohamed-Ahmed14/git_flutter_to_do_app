import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app_v2/view/all_task.dart';
import 'package:note_app_v2/view/archived_task.dart';
import 'package:note_app_v2/view/component/tab_bar.dart';
import 'package:note_app_v2/view/done_task.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_state.dart';

import 'component/widget/show_dialog.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: TabBarCustom(
            tabs: [
              Tab(
                text:"All Tasks" ,
              ),
              Tab(
                  text:"Done"
              ),
              Tab(
                  text:"Archived"
              ),

            ],
            children:[
              AllTask(),
              DoneTask(),
              ArchivedTask(),
            ]),


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => OpenDialog(),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
      ),
    );
  }
}
