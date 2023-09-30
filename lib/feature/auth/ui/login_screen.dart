import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakaton/app/domain/utils.dart';
import 'package:hakaton/feature/auth/domain/auth_state/auth_cubit.dart';

import '../../../app/domain/di/init_di.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (Utils.checkScreen(context)) {
      return Scaffold(
        appBar: AppBar(title: const Text("LoginScreen")),
        body: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    validator: emptyValidator,
                    maxLines: 1,
                    controller: controllerLogin,
                    decoration: const InputDecoration(
                        labelText: "логин", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: emptyValidator,
                    maxLines: 1,
                    controller: controllerPassword,
                    decoration: const InputDecoration(
                        labelText: "пароль", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          context.read<AuthCubit>().signIn(
                              username: controllerLogin.text,
                              password: controllerPassword.text);
                        }
                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(double.maxFinite, 40))),
                      child: const Text("Войти")),
                  SizedBox(height: 16,),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          context.read<AuthCubit>().signIn(
                              username: controllerLogin.text,
                              password: controllerPassword.text);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:MaterialStateProperty.all<Color>(Colors.cyanAccent) ,
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(double.maxFinite, 40))),
                      child: const Text("Зарегистрироваться"))

                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text("LoginScreen")),
        body: Form(
          key: formKey,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    validator: emptyValidator,
                    maxLines: 1,
                    controller: controllerLogin,
                    decoration: const InputDecoration(
                        labelText: "логин", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: emptyValidator,
                    maxLines: 1,
                    controller: controllerPassword,
                    decoration: const InputDecoration(
                        labelText: "пароль", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        context.read<AuthCubit>().signIn(
                            username: controllerLogin.text,
                            password: controllerPassword.text);
                      }
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(double.maxFinite, 40))),
                    child: const Text("Войти"),
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          context.read<AuthCubit>().signIn(
                              username: controllerLogin.text,
                              password: controllerPassword.text);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:MaterialStateProperty.all<Color>(Colors.cyanAccent) ,
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(double.maxFinite, 40))),
                        child: const Text("Зарегистрироваться"))
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  String? emptyValidator(String? value) {
    if (value?.isEmpty == true) {
      return "Обязательное поле";
    }
    return null;
  }
}
