
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager/application/functions/auth_functions.dart';
import 'package:taskmanager/core/constants.dart';

class ForgotPassWordPage extends StatelessWidget {
  ForgotPassWordPage({super.key});
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/password.svg',
                    height: 100,
                  ),
                  kHeight20,
                  const Text(
                    'Enter your Email and we will send you a Password reset link',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  kHeight20,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter Email',
                        hintStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),

                  kHeight20,
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        authFn.resetPassword(
                            emailController.text.trim(), context);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(161, 123, 133, 249),
                      ),
                      child: const Center(
                        child: Text(
                          'Verify',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  // KButton(
                  //     onClick: () {
                  //       if (formKey.currentState!.validate()) {
                  //         authFn.resetPassword(
                  //             emailController.text.trim(), context);
                  //       }
                  //     },
                  //     label: Center(
                  //       child: Text(
                  //         'Reset Password',
                  //         style:TextStyle(fontSize: 20,color: Colors.white),

                  //       ),
                  //     ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
