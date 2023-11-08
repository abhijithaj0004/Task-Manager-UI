
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanager/application/functions/auth_functions.dart';
import 'package:taskmanager/core/constants.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  final fomrKey = GlobalKey<FormState>();
  final authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: fomrKey,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover,
                        opacity: 200)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const StepOutImg(
                    //   height: 170,
                    // ),
                    Lottie.asset('assets/animation/singing-contract.json',
                        height: 300),

                    const Text('Sign Up and Continue',
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 54, 54, 54))),

                    kHeight30,
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      // controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter Your Name',
                        hintStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140)),
                      ),
                    ),
                    kHeight30,
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter Your Email',
                          hintStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 140, 140, 140))),
                    ),
                    kHeight30,

                    TextFormField(
                        // obscureText: state.ischanged,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          // suffixIcon: IconButton(
                          //     onPressed: () {
                          //       // context.read<HidePasswordCubit>().toggle();
                          //     },
                          //     icon: Icon(state.ischanged
                          //         ? Icons.visibility
                          //         : Icons.visibility_off)),
                          focusedBorder: const OutlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 140, 140, 140)),
                        )),

                    kHeight30,
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required';
                        }
                        return null;
                      },
                      controller: confirmPassWordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140)),
                      ),
                    ),
                    kHeight30,
                    InkWell(
                        onTap: () {
                          if (fomrKey.currentState!.validate()) {
                            authFn.SignUp(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                confirmPassWordController.text.trim(),
                                context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(161, 123, 133, 249),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        )),
                    kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an Account?',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 129, 129, 129))),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(' Sign In',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 112, 124, 250),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
