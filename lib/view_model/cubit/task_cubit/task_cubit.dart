

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app_v2/model/task_type.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_state.dart';
import 'package:note_app_v2/view_model/data/network/dio_helper.dart';
import 'package:note_app_v2/view_model/data/network/end_points.dart';

import '../../../model/task_model.dart';

class TaskCubit extends Cubit<TaskState>
{
  TaskCubit():super(TaskInitState());

  static TaskCubit get(context)=>BlocProvider.of<TaskCubit>(context);


  TextEditingController titleController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  //TextEditingController timeController = TextEditingController();

  List<Task> tasksList=[];
  //int id =0;

  // void addTask(){
  //     tasksList.add(Task(
  //       id:id ,
  //       title: titleController.text,
  //       date: dateController.text,
  //       time: timeController.text,
  //       type: TaskType.all
  //     ));
  //     id++;
  //     emit(AddTaskSuccessState());
  // }

  // void changeTaskType(int index,TaskType type)
  // {
  //   tasksList[index].type = type;
  //   emit(ChangeTaskTypeState());
  // }
  
  Future<void> getAllTasks()async{
    emit(GetAllTasksLoadingState());
    await DioHelper.get(endPoint: EndPoints.tasks,
      withToken: true,
    ).then((value){
        for(var i in value.data["data"]["tasks"])
          {
            tasksList.add(Task.fromJson(i));
          }
        print(value.data);
        emit(GetAllTasksSuccessState());
    }).catchError((error){
      print(error.response.data);
      if(error is DioException)
        {
          Fluttertoast.showToast(msg: error.response?.data["message"].toString()??"Error in login",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              gravity:ToastGravity.BOTTOM,
              fontSize: 16,
              timeInSecForIosWeb: 2);
        }
      emit(GetAllTasksErrorState());
      throw error;
    });
  }
  
  Future<void> addTask()async{
    emit(AddTasksLoadingState());
    await DioHelper.post(endPoint: EndPoints.tasks,
      body: {
      "title":titleController.text,
        "description":descriptionController.text,
        "start_date":startDateController.text,
        "end_date":endDateController.text,
        "status":"new",
      },
      withToken: true,
    ).then((value){
      print(value.data);
      tasksList.add(Task.fromJson(value.data["data"]));

      emit(AddTasksSuccessState());
    }).catchError((error){
      print(error.response?.data);
      
      if(error is DioException)
      {
        Fluttertoast.showToast(msg: error.response?.data["message"].toString()??"Error in Adding Task",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            gravity:ToastGravity.BOTTOM,
            fontSize: 16,
            timeInSecForIosWeb: 2);
      }
      emit(AddTasksErrorState());
      throw error;
    });
  }
  
  
  Future<void> deleteTask({required int id})async{
    emit(DeleteTasksLoadingState());
    
    await DioHelper.delete(endPoint: "${EndPoints.tasks}/${id}",
    withToken: true,
    ).then((value){
      print(value.data);
      Fluttertoast.showToast(msg: "Task Deleted Successfully",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity:ToastGravity.BOTTOM,
          fontSize: 16,
          timeInSecForIosWeb: 2);
      emit(DeleteTasksSuccessState());
    }).catchError((error){
      print(error.response.data);
      if(error is DioException)
       Fluttertoast.showToast(msg:error.response?.data["message"].toString()?? "Error on Deleted Successfully",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity:ToastGravity.BOTTOM,
          fontSize: 16,
          timeInSecForIosWeb: 2);
      emit(DeleteTasksErrorState());
      throw error;



    });
  }

  Future<void> editTask({required int id}) async{
    emit(EditTasksLoadingState());
    await DioHelper.post(endPoint: "${EndPoints.tasks}/${id}",
    withToken: true,
      body:{
      "_method":"PUT",
        "title":titleController.text,
        "description":descriptionController.text,
        "start_date":startDateController.text,
        "end_date":endDateController.text,
        "status":"new",
      }
    ).then((value) {
      print(value.data);
      Fluttertoast.showToast(msg: "Task Editing Successfully",
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          gravity:ToastGravity.BOTTOM,
          fontSize: 16,
          timeInSecForIosWeb: 2);
      emit(EditTasksSuccessState());
    }).catchError((error){
      print(error.response.data);
      if(error is DioException)
        Fluttertoast.showToast(msg: error.response?.data["message"].toString() ??"Error on  Editing Task",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            gravity:ToastGravity.BOTTOM,
            fontSize: 16,
            timeInSecForIosWeb: 2);
      emit(EditTasksErrorState());
      throw error;

    });
  }

  void reset(){
    titleController.clear();
    descriptionController.clear();
    startDateController.clear();
    endDateController.clear();
    emit(ResetControllersSuccessState());
  }
  




}