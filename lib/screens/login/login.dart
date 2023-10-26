import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/router/routes.dart';
import 'package:todo/screens/sign_up/sign_up.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';
import 'package:todo/shared/network/firebase/firebase_manger.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login/SignUp',
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Login',
              ),
              Tab(
                text: 'Sign up',
              )
            ]),
          ),
          body: TabBarView(children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return ' please enter valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseManger.loginUser(
                              emailAddress: emailController.text,
                              password: passwordController.text,
                              onSuccess: () {
                                provider.initUser();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes.homeLayout,
                                  (route) => false,
                                );
                              },
                              onFail: (error) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Error'),
                                    content: Text(error.toString()),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('oka'))
                                    ],
                                  ),
                                );
                              });
                        }
                      },
                      child: const Text('login'),
                    ),
                  )
                ],
              ),
            ),
            SignUp()
          ])),
    );
  }
}
