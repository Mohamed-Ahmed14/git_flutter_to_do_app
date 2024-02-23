

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_v2/view/screens/login_screen.dart';
import 'package:note_app_v2/view/task_screen.dart';
import 'package:note_app_v2/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:note_app_v2/view_model/data/local/shared_helper.dart';
import 'package:note_app_v2/view_model/data/network/dio_helper.dart';

void main()
{

  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init() ;
  DioHelper.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => TaskCubit(),),
      BlocProvider(create: (context) => AuthCubit(),),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: TaskScreen(),
      home: LoginScreen(),
    ),

  ));
}