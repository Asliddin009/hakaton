import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakaton/app/domain/utils.dart';
import 'package:hakaton/app/presentation/components/app_snack_bar.dart';
import 'package:hakaton/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:hakaton/feature/auth/ui/register_screen.dart';
import 'package:hakaton/feature/main/main_screen.dart';

import '../../../app/data/shared_preferences/shared_preferences_storag.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerLogin = TextEditingController();

  final controllerPassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  String token = '';

  @override
  void initState() {
    PreferencesStorage.getAuthToken().then((value) {
      token = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Utils.checkScreen(context)) {
      return Scaffold(
        appBar: AppBar(title: const Text("Авторизация")),
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
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.cyanAccent),
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
        appBar: AppBar(title: const Text("Авторизация2")),
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
                    onPressed: () async {
                      if (formKey.currentState?.validate() == true) {
                        try {
                          //locator.get<AuthCubit>().startLoading();
                          final dio = Dio();
                          final response = await dio.post(
                              'http://10.241.1.152:8080/api/v1/auth/token/login/',
                              data: {
                                'username': controllerLogin.text,
                                'password': controllerPassword.text
                              });
                          print(response.statusCode);
                          if (response.statusCode == 200) {
                            print("Записали");
                            PreferencesStorage.setAuthToken(
                                response.data['auth_token']);
                            final response2 = await dio.get(
                                "http://10.241.1.152:8080/api/v1/auth/users/me",
                                options: Options(headers: {
                                  "Authorization":
                                      "token ${response.data['auth_token']}"
                                }));
                            if (response2.statusCode == 200) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            }
                          }
                        } catch (error) {
                          //locator.get<AuthCubit>().logOut();
                          AppSnackBar.showSnackBarWithMessage(
                              context, "Что то пошло не так");
                        }

/*
                        context.read<AuthCubit>().signIn(
                            username: controllerLogin.text,
                            password: controllerPassword.text);*/
                      }
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(double.maxFinite, 40))),
                    child: const Text("Войти"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.cyanAccent),
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
