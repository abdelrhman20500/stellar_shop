import 'package:flutter/material.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  const Icon(Icons.shopping_cart_rounded,size: 100, color: Colors.white,),
                  const SizedBox(height: 10),
                  const Text("Stellar Shop",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white,letterSpacing: 2,),),
                  const Text("Welcome Back",
                    style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.w500,),),
                  const SizedBox(height: 50),
                  Container(
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
                          label: "Email",
                          textEditingController: emailController,
                          prefixIcon: const Icon(Icons.email_outlined),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          label: "Password",
                          textEditingController: passwordController,
                          prefixIcon: const Icon(Icons.lock_open_outlined),
                          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                          keyboardType: TextInputType.text,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?",
                              style: TextStyle(color: Color(0xFFFF6B00),fontWeight: FontWeight.bold,),),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(text: "Login",onPressed: (){},),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ",
                        style: TextStyle(color: Colors.white70),),
                      GestureDetector(
                        onTap: () {},
                        child: const Text("Sign Up",
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
  }
}


