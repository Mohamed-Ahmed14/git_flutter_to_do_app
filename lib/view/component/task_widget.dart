
import 'package:flutter/material.dart';
import 'package:note_app_v2/model/task_type.dart';
import 'package:note_app_v2/view/component/widget/show_dialog.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_cubit.dart';

import '../../model/task_model.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({required this.task,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(

        borderRadius: BorderRadius.circular(20),
        onTap: (){
          showDialog(context: context, builder: (context) => OpenDialog(task:task),);
        },
        child: Container(
          padding:const EdgeInsets.all(15),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blueGrey
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title??"",style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),),
              Text(task.description??"",style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(task.startDate??"",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  Text(task.endDate??"",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  // if(task.type == TaskType.all)
                  // IconButton(onPressed: (){
                  //   TaskCubit.get(context).changeTaskType(task.id??0, TaskType.done);
                  // },
                  //     icon: Icon(Icons.done_all_outlined,color: Colors.green,)),
                  // SizedBox(width: 5,),
                  // if(task.type == TaskType.all || task.type == TaskType.done)
                  // IconButton(onPressed: (){
                  //   TaskCubit.get(context).changeTaskType(task.id??0, TaskType.archived);
                  // },
                  //     icon: Icon(Icons.archive_outlined,color: Colors.black,)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
