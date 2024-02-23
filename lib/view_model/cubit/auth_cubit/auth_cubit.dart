

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app_v2/view_model/data/local/shared_helper.dart';
import 'package:note_app_v2/view_model/data/local/shared_keys.dart';
import 'package:note_app_v2/view_model/data/network/dio_helper.dart';
import 'package:note_app_v2/view_model/data/network/end_points.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState>{

  AuthCubit():super(AuthInitState());
  static AuthCubit get(context)=>BlocProvider.of<AuthCubit>(context);

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordConfirmController=TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscureText=true;

  void changeObscure(){
    obscureText=!obscureText;
    emit(AuthChangeObscureState());
  }


  Future<void> login() async{
    emit(AuthLoginLoadingState());
      await DioHelper.post(
          endPoint: EndPoints.login,
        body: {
        "email" : emailController.text,
          "password" : passwordController.text,
        }
      ).then((value) async {
        SharedHelper.set(key: SharedKeys.token, value: value.data["data"]["token"]);
        SharedHelper.set(key: SharedKeys.userEmail, value: value.data["data"]["user"]["email"]);
        SharedHelper.set(key: SharedKeys.userId, value: value.data["data"]["user"]["id"]);
        SharedHelper.set(key: SharedKeys.userName, value: value.data["data"]["user"]["name"]);
        emit(AuthLoginSuccessState());
      }).catchError((error){
        print(error.response?.data.toString());
        if(error is DioException)
          {
            Fluttertoast.showToast(msg: error.response?.data["message"].toString()??"Error in login",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            gravity:ToastGravity.BOTTOM,
            fontSize: 16,
            timeInSecForIosWeb: 2);
          }
        emit(AuthLoginErrorState());
        throw error;
      });

  }

  Future<void> register()async{
    emit(AuthRegisterLoadingState());
    await DioHelper.post(endPoint: EndPoints.register,
    body: {
      "name":nameController.text,
      "email":emailController.text,
      "password":passwordController.text,
      "password_confirmation":passwordConfirmController.text
    },
    ).then((value){
      SharedHelper.set(key: SharedKeys.userName, value: value.data["data"]["user"]["name"]);
      SharedHelper.set(key: SharedKeys.userId, value: value.data["data"]["user"]["id"]);
      SharedHelper.set(key: SharedKeys.userEmail, value: value.data["data"]["user"]["email"]);
      SharedHelper.set(key: SharedKeys.token, value: value.data["data"]["token"]);
      emit(AuthRegisterSuccessState());
    }).catchError((error){
      print(error.response?.data.toString());
      if(error is DioException)
        {
          Fluttertoast.showToast(msg: error.response?.data["message"].toString()??"Error in register",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              gravity:ToastGravity.BOTTOM,
              fontSize: 16,
              timeInSecForIosWeb: 2);
        }
      emit(AuthRegisterErrorState());
      throw error;
    });
  }
}