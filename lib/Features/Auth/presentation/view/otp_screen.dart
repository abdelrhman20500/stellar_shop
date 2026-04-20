import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:stellar_shop/Core/function/api_service.dart';
import 'package:stellar_shop/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:stellar_shop/Features/Auth/domain/use_case/otp_use_case.dart';
import 'package:stellar_shop/Features/Auth/presentation/view/login_screen.dart';
import 'package:stellar_shop/Features/Auth/presentation/view_manager/otp_cubit/otp_cubit.dart';
import 'package:stellar_shop/Features/Auth/presentation/view_manager/otp_cubit/otp_state.dart';
import '../../../../Core/utils/error_dialog.dart';
import '../../../../Core/utils/loading_dialog.dart';
import '../../../../Core/utils/success_dialog.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_text_field.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => OtpCubit(OtpUseCase(AuthRepoImpl(apiService: ApiService(Dio(),),),),),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpLoading) {
            showLoadingDialog(context);
          } else if (state is OtpFailure) {
            closeLoadingDialog(context);
            showErrorDialog(context, state.error);
          } else if (state is OtpSuccess) {
            closeLoadingDialog(context);
            showSuccessDialog(context, state.response);
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFF6B00), Color(0xFFFF8C00)],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.verified_user_rounded, size: 100, color: Colors.white,),
                        SizedBox(height: height*0.03),
                        const Text("Stellar Shop",
                          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white,),),
                        const Text("OTP Verification",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),),
                        SizedBox(height: height*0.01),
                        Text("Enter the 6-digit code sent to your email",
                          textAlign: TextAlign.center,style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8),),),
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
                                  label: "Email Address",
                                  textEditingController: emailController,
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  keyboardType: TextInputType.emailAddress,),
                                SizedBox(height: height*0.02),
                                OtpTextField(
                                  numberOfFields: 6,
                                  fieldWidth: 36,
                                  showFieldAsBox: true,
                                  cursorColor: const Color(0xFFFF6B00),
                                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                                  borderColor: const Color(0xFFFF6B00),
                                  enabledBorderColor: const Color(0xFFFF6B00),
                                  focusedBorderColor: const Color(0xFFFF4500),
                                  disabledBorderColor: Colors.grey,
                                  onSubmit: (verificationCode) {
                                    otpCode = verificationCode;
                                  },
                                ),
                                SizedBox(height: height*0.03),
                                CustomButton(
                                  text: "Verify OTP",
                                  onPressed: () {
                                    final formOk = formKey.currentState?.validate() ?? false;
                                    if (!formOk) return;
                                    final code = otpCode ?? '';
                                    if (code.isEmpty) {
                                      showErrorDialog(
                                        context,
                                        "Please enter the OTP code.",
                                      );
                                      return;
                                    }
                                    context.read<OtpCubit>().otp(emailController.text, code,);
                                  },
                                ),
                              ],
                            ),
                          ),
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