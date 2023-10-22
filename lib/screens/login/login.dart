import 'package:flutter/material.dart';
import 'package:todo/screens/sign_up/sign_up.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    decoration: InputDecoration(hintText: 'Email'),
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
                      decoration: InputDecoration(hintText: 'password', )
                      ,
                      obscureText: true,
                
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(emailController.text);
                      }
                    },
                    child: const Text('login'),
                  )
                ],
              ),
            ),
            SignUp()
          ])),
    );
  }
}
