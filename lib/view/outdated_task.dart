import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task_model.dart';
import '../view_model/cubit/task_cubit/task_cubit.dart';
import '../view_model/cubit/task_cubit/task_state.dart';
import 'component/task_widget.dart';

class OutDatedTask extends StatelessWidget {
  const OutDatedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit,TaskState>(
      builder: (context, state) {
        var cubit = TaskCubit.get(context);

        List<Task> outdatedList = cubit.tasksList.where((element) => element.status == "outdated").toList();
        return Visibility(
          visible: outdatedList.isNotEmpty,
          replacement:const  Center(child: Text("No Available Data")),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return TaskWidget(task: outdatedList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 1,
                );
              },
              itemCount: outdatedList.length),
        );
      },

    );

  }
}
