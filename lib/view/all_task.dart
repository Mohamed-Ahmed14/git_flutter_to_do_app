import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_v2/model/task_type.dart';
import 'package:note_app_v2/view/component/task_widget.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_cubit.dart';

import '../model/task_model.dart';
import '../view_model/cubit/task_cubit/task_state.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TaskCubit,TaskState>(
      builder: (context, state) {
        var cubit = TaskCubit.get(context);

        List<Task> allTasks = cubit.tasksList.where((element) => element.status == "new").toList();
        return Visibility(
          visible: state is GetAllTasksSuccessState || state is AddTasksSuccessState,
          replacement: Center(child: CircularProgressIndicator(),),
          child: Visibility(
            visible: allTasks.isNotEmpty,
            replacement:const  Center(child: Text("No Available Data")),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return TaskWidget(task: allTasks[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 1,
                  );
                },
                itemCount: allTasks.length),
          ),
        );
      },

    );
  }
}
