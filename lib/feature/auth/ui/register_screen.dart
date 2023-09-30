import 'package:dio/dio.dart';
import 'package:hakaton/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/components/app_snack_bar.dart';
import '../../../app/presentation/components/app_text_button.dart';
import '../../../app/presentation/components/app_text_field.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final controllerLogin = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerPassword2 = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RegisterScreen")),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                AppTextField(controller: controllerLogin, labelText: "логин"),
                const SizedBox(height: 16),
                AppTextField(
                  obscureText: true,
                  controller: controllerPassword,
                  labelText: "пароль",
                ),
                const SizedBox(height: 16),
                AppTextField(
                  obscureText: true,
                  controller: controllerPassword2,
                  labelText: "повторите пароль",
                ),
                const SizedBox(height: 16),
                AppTextButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: () async {
                    if (formKey.currentState?.validate() != true) return;

                    if (controllerPassword2.text != controllerPassword.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Пароли не совпадают")));
                    } else {
                      final dio = Dio();
                      final response = await dio.post(
                          'http://192.168.151.222:8080/api/v1/auth/users/',
                          data: {
                            'username': controllerLogin.text,
                            'password': controllerPassword.text
                          });
                      if(response.statusCode==201) {
                        AppSnackBar.showSnackBarWithMessage(
                            context, "Вы успешно зарегистрировались");
                      }else{
                        AppSnackBar.showSnackBarWithMessage(
                            context, "Пользователь с таким именем уже существует");
                      }

                    }
                  },
                  text: "регистрация",
                ),
                SizedBox(height: 16,)
                ,Text(        "Введённый пароль слишком короткий. Он должен содержать как минимум 8 символов.\nВведённый пароль слишком широко распространён.\nВведённый пароль состоит только из цифр.")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapToSignUp(AuthCubit authCubit) => authCubit.signUp(
        username: controllerLogin.text,
        password: controllerPassword.text,
        email: controllerEmail.text,
      );
}
