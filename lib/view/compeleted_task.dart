import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_v2/model/task_type.dart';
import 'package:note_app_v2/view/component/task_widget.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_state.dart';

import '../model/task_model.dart';

class CompeletedTask extends StatelessWidget {
  const CompeletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit,TaskState>(builder: (context, state) {
      var cubit = TaskCubit.get(context);
      List<Task> compeletedTasks = cubit.tasksList.where((element) => element.status=="compeleted").toList();

      return Visibility(
        visible: compeletedTasks.isNotEmpty,
        replacement: Center(
          child: Text("No Data Available"),
        ),
        child: ListView.separated(itemBuilder: (context, index) {
          return TaskWidget(task: compeletedTasks[index]);
        }, separatorBuilder: (context, index) {
          return SizedBox(height: 4,);
        }, itemCount: compeletedTasks.length),
      );
    },);
  }
}
