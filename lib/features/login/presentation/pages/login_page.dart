import 'package:flutter/material.dart';
import 'package:tdd_with_riverpod/core/presentation/widgets/snakbar.dart';
import 'package:tdd_with_riverpod/core/validations.dart';
import 'package:tdd_with_riverpod/features/products/presentation/pages/products_page.dart';

class LoginPage extends StatelessWidget {
  late final Validator validator;
  final emailAddressController = TextEditingController(text: 'kp@gmail.com');
  final passwordController = TextEditingController(text: 'Password');

  LoginPage({super.key}) {
    validator = Validator();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: TextField(
                  key: const Key('email'),
                  controller: emailAddressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: TextFormField(
                  key: const Key('password'),
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: ElevatedButton(
                  key: const Key('login_btn'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.lightBlueAccent,
                    ),
                  ),
                  onPressed: () {
                    bool emailValidation = validator.validateEmail(
                        value: emailAddressController.text);
                    bool passwordValidation = validator.validatePassword(
                        value: passwordController.text);
                    if (!emailValidation) {
                      SnackBarWidget.errorSnackBar(context,
                          message: 'enter correct email...!!!');
                      return;
                    }
                    if (!passwordValidation) {
                      SnackBarWidget.errorSnackBar(context,
                          message: 'enter correct password...!!!');
                      return;
                    }
                    // SnackBarWidget.successSnackBar(context,
                    //     message: 'login successfully...!!!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductsPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
