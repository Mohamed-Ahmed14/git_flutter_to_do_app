import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app_v2/view/component/widget/text_form_custom.dart';
import 'package:note_app_v2/view/screens/login_screen.dart';
import 'package:note_app_v2/view_model/cubit/auth_cubit/auth_cubit.dart';

import '../../view_model/cubit/auth_cubit/auth_state.dart';
import '../component/widget/elevated_button_custom.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Padding(
            padding:const EdgeInsets.all(15),
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Welcome, To Task App",style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),),
                  const SizedBox(height: 10,),
                  const Text("Register Now and start your journey",style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),),
                  const SizedBox(height: 60,),

                   TextFormFieldCustom(label: "Name",
                  controller: cubit.nameController,
                   obscureText: false,
                   validator: (value){
                     if((value??"").isEmpty)
                       return "Enter Your Name";
                     return null;
                   }),
                  const SizedBox(height: 12,),
                   TextFormFieldCustom(label: "Email",
                   controller: cubit.emailController,
                   obscureText: false,
                       validator: (value){
                         if((value??"").isEmpty)
                           return "Enter Your Email";
                         return null;
                       }),
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
                         if((value??"").isEmpty)
                           return "Enter Your Password";
                         return null;
                       }),
                  const SizedBox(height: 12,),
                   TextFormFieldCustom(label: "Password Confirmation",
                   controller: cubit.passwordConfirmController,
                       suffixIcon: IconButton(
                         onPressed: (){
                           cubit.changeObscure();
                         },
                         icon: cubit.obscureText?Icon(Icons.visibility_off_outlined,color: Colors.grey,):
                         Icon(Icons.visibility_outlined,color: Colors.grey,),
                       ),
                       obscureText: cubit.obscureText,
                       validator: (value){
                     print(value);
                         if((value??"").isEmpty)
                           return "Enter Your PasswordConfirmation";
                         else if(value.toString()!=cubit.passwordController.text)
                           {
                             print(cubit.passwordController.text);
                             return "Password not match";
                           }
                         return null;
                       }),
                  const SizedBox(height: 20,),

                  ElevatedButtonCustom(onPressed: (){
                    if(cubit.formKey.currentState!.validate())
                      {
                        cubit.register().then((value) {
                          Fluttertoast.showToast(
                              msg:"Register Successfully",
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2);
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          },));
                        });

                      }

                  },
                    child:const Text("Register"),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    width: 120,
                    height: 45,
                  ),

                ],


              ),
            ),
          );
        },
      ),
    );
  }
}
