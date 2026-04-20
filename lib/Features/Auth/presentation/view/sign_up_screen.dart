import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stellar_shop/Core/function/api_service.dart';
import 'package:stellar_shop/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:stellar_shop/Features/Auth/domain/use_case/register_use_case.dart';
import 'package:stellar_shop/Features/Auth/presentation/view_manager/Register_cubit/register_cubit.dart';
import 'package:stellar_shop/Features/layout/presentation/view/layout_screen.dart';
import '../../../../Core/utils/error_dialog.dart';
import '../../../../Core/utils/loading_dialog.dart';
import '../../../../Core/utils/success_dialog.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_text_field.dart';
import '../view_manager/Register_cubit/register_state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterUseCase(
        AuthRepoImpl(apiService: ApiService(Dio()))
      )),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterLoading){
            showLoadingDialog(context);
          }else if(state is RegisterFailure){
            closeLoadingDialog(context);
            showErrorDialog(context, state.error);
          }else if(state is RegisterSuccess){
            closeLoadingDialog(context);
            showSuccessDialog(context, state.registerModel.message!);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
            LayoutScreen()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF6B00),
                    Color(0xFFFF8C00),
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height*0.01),
                        const Icon(Icons.shopping_cart_rounded,size: 80, color: Colors.white,),
                        SizedBox(height: height*0.01),
                        const Text("Stellar Shop",
                          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white,letterSpacing: 2,),),
                        const Text("Welcome Back",
                          style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.w500,),),
                        SizedBox(height: height*0.03),
                        Form(
                          key: formKey,
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  label: "First Name",
                                  textEditingController: firstNameController,
                                  prefixIcon: const Icon(Icons.person),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(height: height*0.02),
                                CustomTextFormField(
                                  label: "Last Name",
                                  textEditingController: lastNameController,
                                  prefixIcon: const Icon(Icons.person),
                                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(height: height*0.02),
                                CustomTextFormField(
                                  label: "Email",
                                  textEditingController: emailController,
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(height: height*0.02),
                                CustomTextFormField(
                                  label: "Password",
                                  textEditingController: passwordController,
                                  prefixIcon: const Icon(Icons.lock_open_outlined),
                                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(height: height*0.02),
                                CustomButton(text: "Sign Up",onPressed: ()
                                {
                                  if(formKey.currentState!.validate()){
                                    BlocProvider.of<RegisterCubit>(context).register(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        passwordController.text
                                    );
                                  }
                                },),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already Have An Account  ",
                              style: TextStyle(color: Colors.white70),),
                            GestureDetector(
                              onTap: () {},
                              child: const Text("Login",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16,),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


