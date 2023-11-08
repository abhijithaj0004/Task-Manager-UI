import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanager/application/functions/auth_functions.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/screens/authentication/forgot_password.dart';
import 'package:taskmanager/presentation/screens/authentication/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  opacity: 200,
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Lottie.asset('assets/animation/singing-contract.json',
                    height: 300),
                // const Text(
                //   'Task Manager',
                //   style: TextStyle(fontSize: 30),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/lock.svg',
                      height: 25,
                    ),
                    kWidth10,
                    const Text('Sign In and Continue',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 54, 54, 54))),
                  ],
                ),
                kHeight20,
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email Required';
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
                            hintText: 'Enter Email',
                            hintStyle: const TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 140, 140, 140)),
                          ),
                        ),
                        kHeight20,
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password Required';
                            }
                            return null;
                          },
                          controller: passwordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter Password',
                            hintStyle: const TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 140, 140, 140)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                kHeight20,
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      AuthFn().signIn(context, emailController.text.trim(),
                          passwordcontroller.text.trim());
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
                        'SignIn',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                kHeight20,
                InkWell(
                  onTap: () {
                    AuthFn().signInWithGoogle();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 210, 210, 210)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 50,
                            child: Image.asset('assets/images/googlepics.png')),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                      },
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 108, 120, 250)),
                      ),
                    ),
                  ],
                ),
                kHeight10,
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPassWordPage(),
                    ));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 108, 120, 250)),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
