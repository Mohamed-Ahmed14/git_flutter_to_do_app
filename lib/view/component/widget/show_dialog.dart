import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_state.dart';

import '../../../model/task_model.dart';

class OpenDialog extends StatelessWidget {
  final Task? task;
  const OpenDialog({this.task,super.key});

  @override
  Widget build(BuildContext context) {
    if(task != null)
    {
      TaskCubit.get(context).titleController.text=task?.title??"";
      TaskCubit.get(context).descriptionController.text=task?.description??"";
      TaskCubit.get(context).startDateController.text=task?.startDate ??"";
      TaskCubit.get(context).endDateController.text=task?.endDate?? "";
    }
    else
    {
      TaskCubit.get(context).reset();
    }


    return BlocConsumer<TaskCubit, TaskState>(
      builder: (context, state) {
        var cubit = TaskCubit.get(context);

        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Colors.blue, width: 1),
          ),
          title:task!=null? Text(
          "Edit Task",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ):Text(
            "Add Task",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: cubit.titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 1),
                  ),
                ),
                cursorColor: Colors.blue,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: cubit.descriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 1),
                  ),
                ),
                cursorColor: Colors.blue,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: cubit.startDateController,
                keyboardType: TextInputType.none,
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2016),
                    lastDate: DateTime(2031),
                    initialDate: DateTime.now(),
                  ).then(
                        (value) {
                      // cubit.startDateController.text =
                      // "${value!.day}-${value.month}-${value.year}";
                      // cubit.startDateController.text =
                      // "${value!.year}-${value.month}-${value.day}";
                      if(value != null)
                        cubit.startDateController.text = DateFormat('yyyy-MM-dd').format(value);
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: "Start Date",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 1),
                  ),
                ),
                cursorColor: Colors.blue,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: cubit.endDateController,
                keyboardType: TextInputType.none,
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2016),
                    lastDate: DateTime(2031),
                    initialDate: DateTime.now(),
                  ).then(
                        (value) {
                      // cubit.endDateController.text =
                      // "${value!.day}-${value.month}-${value.year}";
                      // cubit.endDateController.text =
                      // "${value!.year}-${value.month}-${value.day}";
                      if(value != null)
                        cubit.endDateController.text = DateFormat('yyyy-MM-dd').format(value);
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: "End Date",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 1),
                  ),
                ),
                cursorColor: Colors.blue,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              // TextFormField(
              //   controller: cubit.timeController,
              //   keyboardType: TextInputType.none,
              //   onTap: () {
              //     showTimePicker(
              //         context: context,
              //         initialTime: TimeOfDay.now())
              //         .then(
              //           (value) {
              //         cubit.timeController.text =
              //         "${value!.hour}:${value.minute}";
              //       },
              //     );
              //   },
              //   decoration: InputDecoration(
              //     hintText: "Time",
              //     hintStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 16,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15),
              //       borderSide: BorderSide(
              //           color: Colors.blue, width: 1),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15),
              //       borderSide: BorderSide(
              //           color: Colors.blue, width: 1),
              //     ),
              //   ),
              //   cursorColor: Colors.blue,
              //   style: TextStyle(
              //     color: Colors.black,
              //   ),
              // ),
              // SizedBox(
              //   height: 60,
              // ),
            ],
          ),
          actions: [
            if(task == null)
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    cubit.addTask();

                  },
                  child: Text(
                    "Add Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            if(task != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(120, 40),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        cubit.deleteTask(id: task!.id ?? 0).then((value){
                          cubit.reset();
                          cubit.tasksList.clear();
                          cubit.getAllTasks();
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Delete Task",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  SizedBox(width: 4,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(100, 40),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        cubit.editTask(id: task!.id ?? 0).then((value){
                          Navigator.pop(context);
                        });

                      },
                      child: Text(
                        "Edit Task",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                ],
              ),



          ],
        );
      },
      listener: (context, state) {
        if(state is AddTasksSuccessState)
        {
          Navigator.pop(context);
          TaskCubit.get(context).reset();

        }
        if(state is EditTasksSuccessState)
        {
          TaskCubit.get(context).tasksList.clear();
          TaskCubit.get(context).getAllTasks();

        }
      },
    );
    // return BlocBuilder<TaskCubit,TaskState>(
    //   builder: (context, state) {
    //     var cubit = TaskCubit.get(context);
    //     // return Column(
    //     //   mainAxisSize: MainAxisSize.min,
    //     //   children: [
    //     //     TextFormField(
    //     //       controller: cubit.titleController,
    //     //       decoration: InputDecoration(
    //     //         hintText: "Title",
    //     //         hintStyle: TextStyle(
    //     //           color: Colors.grey,
    //     //           fontSize: 16,
    //     //         ),
    //     //         focusedBorder: OutlineInputBorder(
    //     //           borderRadius: BorderRadius.circular(15),
    //     //           borderSide: BorderSide(
    //     //               color: Colors.blue, width: 1),
    //     //         ),
    //     //         enabledBorder: OutlineInputBorder(
    //     //           borderRadius: BorderRadius.circular(15),
    //     //           borderSide: BorderSide(
    //     //               color: Colors.blue, width: 1),
    //     //         ),
    //     //       ),
    //     //       cursorColor: Colors.blue,
    //     //       style: TextStyle(
    //     //         color: Colors.black,
    //     //       ),
    //     //     ),
    //     //     SizedBox(
    //     //       height: 10,
    //     //     ),
    //     //     TextFormField(
    //     //       controller: cubit.descriptionController,
    //     //       decoration: InputDecoration(
    //     //         hintText: "Description",
    //     //         hintStyle: TextStyle(
    //     //           color: Colors.grey,
    //     //           fontSize: 16,
    //     //         ),
    //     //         focusedBorder: OutlineInputBorder(
    //     //           borderRadius: BorderRadius.circular(15),
    //     //           borderSide: BorderSide(
    //     //               color: Colors.blue, width: 1),
    //     //         ),
    //     //         enabledBorder: OutlineInputBorder(
    //     //           borderRadius: BorderRadius.circular(15),
    //     //           borderSide: BorderSide(
    //     //               color: Colors.blue, width: 1),
    //     //         ),
    //     //       ),
    //     //       cursorColor: Colors.blue,
    //     //       style: TextStyle(
    //     //         color: Colors.black,
    //     //       ),
    //     //     ),
    //     //     SizedBox(
    //     //       height: 10,
    //     //     ),
    //     //     TextFormField(
    //     //       controller: cubit.startDateController,
    //     //       keyboardType: TextInputType.none,
    //     //       onTap: () {
    //     //         showDatePicker(
    //     //           context: context,
    //     //           firstDate: DateTime(2016),
    //     //           lastDate: DateTime(2031),
    //     //           initialDate: DateTime.now(),
    //     //         ).then(
    //     //               (value) {
    //     //             // cubit.startDateController.text =
    //     //             // "${value!.day}-${value.month}-${value.year}";
    //     //             // cubit.startDateController.text =
    //     //             // "${value!.year}-${value.month}-${value.day}";
    //     //             if(value != null)
    //     //               cubit.startDateController.text = DateFormat('yyyy-MM-dd').format(value);
    //     //           },
    //     //         );
    //     //       },
    //     //       decoration: InputDecoration(
    //     //         hintText: "Start Date",
    //     //         hintStyle: TextStyle(
    //     //           color: Colors.grey,
    //     //           fontSize: 16,
    //     //         ),
    //     //         focusedBorder: OutlineInputBorder(
    //     //           borderRadius: BorderRadius.circular(15),
    //     //           borderSide: BorderSide(
    //     //               color: Colors.blue, width: 1),
    //     //         ),
    //     //         enabledBorder: OutlineInputBorder(
    //     //           borderRadius: BorderRadius.circular(15),
    //     //           borderSide: BorderSide(
    //     //               color: Colors.blue, width: 1),
    //     //         ),
    //     //       ),
    //     //       cursorColor: Colors.blue,
    //     //       style: TextStyle(
    //     //         color: Colors.black,
    //     //       ),
    //     //     ),
    //     //     SizedBox(
    //     //       height: 10,
    //     //     ),
    //     //     TextFormField(
    //     //       controller: cubit.endDateController,
    //     //       keyboardType: TextInputType.none,
    //     //       onTap: () {
    //     //         showDatePicker(
    //     //           context: context,
    //     //           firstDate: DateTime(2016),
    //     //           lastDate: DateTime(2031),
    //     //           initialDate: DateTime.now(),
    //     //         ).then(
    //     //               (value) {
    //     //             // cubit.endDateController.text =
    //     //             // "${value!.day}-${value.month}-${value.year}";
    //     //             // cubit.endDateController.text =
    //     //             // "${value!.year}-${value.month}-${value.day}";
    //     //             if(value != null)
    //     //               cubit.endDateController.text = DateFormat('yyyy-MM-dd').format(value);
    //     //           },
    //     //         );
    //     //       },
    //     //       decoration: InputDecoration(
    //     //         hintText: "End Date",
    //     //         hintStyle: TextStyle(
    //     //           color: Colors.grey,
    //     //           fontSize: 16,
    //     //         ),
    //     //         focusedBorder: OutlineInputBorder(
    //     //           borderRadius: BorderRadius.circular(15),
    //     //           borderSide: BorderSide(
    //     //               color: Colors.blue, width: 1),
    //     //         ),
    //     //         enabledBorder: OutlineInputBorder(
    //     //           borderRadius: BorderRadius.circular(15),
    //     //           borderSide: BorderSide(
    //     //               color: Colors.blue, width: 1),
    //     //         ),
    //     //       ),
    //     //       cursorColor: Colors.blue,
    //     //       style: TextStyle(
    //     //         color: Colors.black,
    //     //       ),
    //     //     ),
    //     //     // TextFormField(
    //     //     //   controller: cubit.timeController,
    //     //     //   keyboardType: TextInputType.none,
    //     //     //   onTap: () {
    //     //     //     showTimePicker(
    //     //     //         context: context,
    //     //     //         initialTime: TimeOfDay.now())
    //     //     //         .then(
    //     //     //           (value) {
    //     //     //         cubit.timeController.text =
    //     //     //         "${value!.hour}:${value.minute}";
    //     //     //       },
    //     //     //     );
    //     //     //   },
    //     //     //   decoration: InputDecoration(
    //     //     //     hintText: "Time",
    //     //     //     hintStyle: TextStyle(
    //     //     //       color: Colors.grey,
    //     //     //       fontSize: 16,
    //     //     //     ),
    //     //     //     focusedBorder: OutlineInputBorder(
    //     //     //       borderRadius: BorderRadius.circular(15),
    //     //     //       borderSide: BorderSide(
    //     //     //           color: Colors.blue, width: 1),
    //     //     //     ),
    //     //     //     enabledBorder: OutlineInputBorder(
    //     //     //       borderRadius: BorderRadius.circular(15),
    //     //     //       borderSide: BorderSide(
    //     //     //           color: Colors.blue, width: 1),
    //     //     //     ),
    //     //     //   ),
    //     //     //   cursorColor: Colors.blue,
    //     //     //   style: TextStyle(
    //     //     //     color: Colors.black,
    //     //     //   ),
    //     //     // ),
    //     //     SizedBox(
    //     //       height: 60,
    //     //     ),
    //     //   ],
    //     // );
    //
    //   },
    // );
  }
}
