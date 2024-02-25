import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_v2/model/task_type.dart';
import 'package:note_app_v2/view/component/task_widget.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_cubit.dart';

import '../model/task_model.dart';
import '../view_model/cubit/task_cubit/task_state.dart';

class DoingTask extends StatelessWidget {
  const DoingTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit,TaskState>(builder: (context, state) {
      var cubit = TaskCubit.get(context);
      List<Task> doingTasks = cubit.tasksList.where((element) => element.status == "doing").toList();
      return Visibility(
        visible: doingTasks.isNotEmpty,
        replacement: Center(
          child: Text("No Data Available"),
        ),
        child: ListView.separated(itemBuilder: (context, index) {
          return TaskWidget(task: doingTasks[index]);
        }, separatorBuilder: (context, index) {
          return SizedBox(height: 4,);
        }, itemCount: doingTasks.length),
      );
    },
    );
  }
}
