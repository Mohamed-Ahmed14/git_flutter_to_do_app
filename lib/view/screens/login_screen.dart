import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app_v2/view/component/widget/text_form_custom.dart';
import 'package:note_app_v2/view/screens/register_screen.dart';
import 'package:note_app_v2/view/task_screen.dart';
import 'package:note_app_v2/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:note_app_v2/view_model/cubit/task_cubit/task_cubit.dart';

import '../../view_model/cubit/auth_cubit/auth_state.dart';
import '../component/widget/elevated_button_custom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocBuilder<AuthCubit,AuthState>(
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Padding(
              padding:const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Welcome, To Task App",style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),),
                  const SizedBox(height: 10,),
                  const Text("Login using your email and password",style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),),
                  const SizedBox(height: 80,),

                  Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                         TextFormFieldCustom(label: "Email",
                        controller: cubit.emailController,
                         validator: (value){
                           if((value ?? "").isEmpty)
                             return "Enter Your Email";
                           else
                             return null;

                         },),
                        const SizedBox(height: 12,),
                        TextFormFieldCustom(label: "Password",
                        controller: cubit.passwordController,

                        suffixIcon: IconButton(
                          onPressed: (){
                            cubit.changeObscure();
                          },
                          icon: cubit.obscureText?Icon(Icons.visibility_off_outlined,color: Colors.grey,):
                          Icon(Icons.visibility_outlined,color: Colors.grey,),
                        ),
                        obscureText: cubit.obscureText,
                        validator: (value){
                          if((value ?? "").isEmpty)
                            return "Enter Your Password";
                          return null;
                        },),
                        const SizedBox(height: 20,),

                        ElevatedButtonCustom(onPressed: (){
                          if(cubit.formKey.currentState!.validate())
                            {
                              cubit.login().then((value){
                                Fluttertoast.showToast(
                                    msg:"Login Successfully",
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 16,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2);
                                TaskCubit.get(context).getAllTasks();

                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return TaskScreen();
                                },));
                              });
                            }

                        },
                          child: Text("Login"),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          width: 120,
                          height: 45,
                        ),
                        TextButton(onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RegisterScreen();
                          },));
                        },
                            child:const Text("Register Now")),
                        const SizedBox(height: 12,),


                      ],


                    ),
                  ),
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}
