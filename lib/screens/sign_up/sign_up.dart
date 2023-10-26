import 'package:flutter/material.dart';
import 'package:todo/router/routes.dart';
import 'package:todo/shared/network/firebase/firebase_manger.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'age',
            ),
            controller: ageController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your age';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'email',
            ),
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'password',
            ),
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FirebaseManger.signUp(
                      emailAddress: emailController.text,
                      password: passwordController.text,
                      onError: (error) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('error have been ouccerd '),
                            content: Text(error),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'))
                            ],
                          ),
                        );
                      },
                      onSccuess: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.homeLayout,
                          (route) => false,
                        );
                      },
                      age: ageController.text,
                      name: nameController.text);
                }
              },
              child: const Text('Sign up'),
            ),
          )
        ],
      ),
    );
  }
}
