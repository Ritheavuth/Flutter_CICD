// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vgo_app/Login/widget.dart';
import 'package:vgo_app/SignUp/controller/sign_up_controller.dart';
import 'package:vgo_app/SignUp/widget.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({Key? key}) : super(key: key);

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  SignUPController signUpController = Get.put(SignUPController());
  bool isLoading = true;
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode passwordConfirmNode = FocusNode();
  FocusNode phoneNode = FocusNode();

  UserModel userData =
      UserModel(firstName: '', lastName: '', email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: FirstNameInput(
                    currendNode: firstNameNode,
                    nextNode: lastNameNode,
                    onSaved: (value) {
                      userData.firstName = value as String;
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: LastNameInput(
                    currendNode: lastNameNode,
                    nextNode: emailNode,
                    onSaved: (value) {
                      userData.lastName = value as String;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Email Input
            EmailInput(
              currendNode: emailNode,
              nextNode: passwordNode,
              onSaved: (value) {
                userData.email = value as String;
              },
            ),
            const SizedBox(height: 20),
            // Password Input
            PasswordInput(
              currendNode: passwordNode,
              nextNode: passwordConfirmNode,
              controller: passwordController,
              onSaved: (value) {
                userData.password = value as String;
              },
            ),
            const SizedBox(height: 20),
            ConfirmPasswordInput(
              currendNode: passwordConfirmNode,
              nextNode: phoneNode,
              passwordcontroller: passwordController,
            ),
            const SizedBox(height: 20),
            // PhoneNumber Input
            PhoneNumberInput(
              currendNode: phoneNode,
              onSaved: (value) {
                userData.phoneNumber = value as String;
              },
            ),

            const SizedBox(height: 20),

            // Sign Up Button ;
            ElevatedButton(
              onPressed: () {
                _onSubmit();
              },
              child: const SizedBox(
                height: 50,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: TextWidget(
                      text: 'Sign Up', color: Colors.white, size: 24),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Palette.primaryColor,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSubmit() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    Get.snackbar(
      '',
      'Signing in...',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
    signUpController
        .signUp(userData.email, userData.password)
        .then((value) async {
      signUpController.createNewUser(userData).then((value) {
        Get.snackbar(
          '',
          'Sign in success',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
        Get.to(
          () => const MainScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 1),
        );
      });
    }).catchError((err) {
      Get.snackbar(
        'failed to Sign Up',
        err,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    });
  }
}
