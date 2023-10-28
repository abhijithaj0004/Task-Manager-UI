import 'package:flutter/material.dart';
import 'package:taskmanager/application/functions/auth_functions.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/screens/authentication/auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                opacity: 200,
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Task Manager',
                style: TextStyle(fontSize: 30),
              ),
              Text('Sign In and Continue',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 54, 54, 54))),
              kHeight20,
              Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(20),
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
                          hintStyle: TextStyle(
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
                          hintStyle: TextStyle(
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
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(161, 123, 133, 249),
                  ),
                  child: Center(
                    child: Text(
                      'SignIn',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
