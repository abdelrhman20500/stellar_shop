import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_text_field.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final emailController = TextEditingController();
  String? otpCode;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
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
                  const Icon(Icons.verified_user_rounded, size: 100, color: Colors.white),
                  const SizedBox(height: 10),
                  const Text(
                    "Stellar Shop",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                  ),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Enter the 6-digit code sent to your email",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 50),

                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 30, spreadRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Email Field
                        CustomTextFormField(
                          label: "Email Address",
                          textEditingController: emailController,
                          prefixIcon: const Icon(Icons.email_outlined),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 25),

                        // ==================== Enhanced OTP Field ====================
                        OtpTextField(
                          numberOfFields: 6,
                          fieldWidth: 36, // Safe range                          borderWidth: 2.5,
                          showFieldAsBox: true,
                          cursorColor: const Color(0xFFFF6B00),
                          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          // Orange Theme Borders
                          borderColor: const Color(0xFFFF6B00),
                          enabledBorderColor: const Color(0xFFFF6B00),
                          focusedBorderColor: const Color(0xFFFF4500), // Darker orange on focus
                          disabledBorderColor: Colors.grey,

                          // Error Styling
                          // errorBorderColor: Colors.red,
                          // hasError: hasError,

                          // Callbacks
                          onCodeChanged: (code) {},
                          onSubmit: (verificationCode) {},
                        ),

                        if (hasError)
                          const Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text(
                              "Invalid OTP. Please try again.",
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                            ),
                          ),

                        const SizedBox(height: 20),

                        // Resend OTP
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // TODO: Add resend OTP logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("OTP Resent")),
                              );
                            },
                            child: const Text(
                              "Resend OTP",
                              style: TextStyle(color: Color(0xFFFF6B00), fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Verify Button
                        CustomButton(
                          text: "Verify OTP",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive the code? ", style: TextStyle(color: Colors.white70)),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Back",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
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
