import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../feature/sprint_table/domain/AddUser.dart';
import '../../data/global_const.dart';
import '../../data/shared_preferences/shared_preferences_storag.dart';
import 'app_snack_bar.dart';
import 'app_text_button.dart';
class LocalAppBar extends StatelessWidget {
  const LocalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: SvgPicture.asset(
                "assets/logo.svg",
                semanticsLabel: 'Logo',
                height: 20,
              ),
            ),
            /* SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),*/
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Выйти",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      color: Colors.black,
                      width: 2,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    AppTextButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          // false = user must tap button, true = tap outside dialog
                          builder: (BuildContext dialogContext) {
                            final controllerName =
                            TextEditingController();
                            return Dialog(
                              insetPadding: const EdgeInsets.all(0),
                              child: Form(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 7.5),
                                  child: Container(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.4,
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.4,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            const Text(
                                              "Создание проекта",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 30),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  size: 30,
                                                ))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          height: 1,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.75,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        const Align(
                                            alignment:
                                            Alignment.centerLeft,
                                            child: Text(
                                              ('Название проекта'),
                                              style:
                                              TextStyle(fontSize: 20),
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: controllerName,
                                          decoration: const InputDecoration(
                                              hintText:
                                              "Введите название проекта",
                                              border:
                                              OutlineInputBorder()),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                            alignment:
                                            Alignment.centerLeft,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                final dio = Dio();
                                                String token =
                                                await PreferencesStorage
                                                    .getAuthToken();
                                                final response = await dio.post(
                                                    "$APP_URL/api/v1/create_project/",
                                                    options: Options(headers: {"Authorization": token}),
                                                    data: {
                                                      "project_title":
                                                      controllerName
                                                          .text
                                                    });
                                                if (response.statusCode ==
                                                    200) {
                                                  AppSnackBar
                                                      .showSnackBarWithMessage(
                                                      context,
                                                      "Проект создан");
                                                } else {
                                                  AppSnackBar
                                                      .showSnackBarWithMessage(
                                                      context,
                                                      "Проект не создан");
                                                }
                                              },
                                              child:
                                              const Text('СОЗДАТЬ'),
                                              style: const ButtonStyle(),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: "СОЗДАТЬ ПРОЕКТ",
                      backgroundColor: Colors.black,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: Colors.black,
                      width: 2,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          add_user_to_project(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: Text("Добавить пользователя")
                    )
                  ],
                )),
          ],
        ));
  }
}



Future<void> add_user_to_project(BuildContext context) {
  final controllerName = TextEditingController();
  final controllerMaster = TextEditingController();
  final controllerSP = TextEditingController();
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 1.25,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Добавление пользователя',
                          style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                            ))
                      ],
                    ),
                    const Divider(
                      height: 10,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, bottom: 8, right: 8, left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Никнейм пользователя",
                            style: TextStyle(fontSize: 22),
                          ),
                          TextField(
                            controller: controllerName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Введите никнейм пользователя",
                              fillColor: Colors.white70,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Text(
                              "Умение пользователя",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                          TextField(
                            controller: controllerMaster,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Введите умение пользователя",
                              fillColor: Colors.white70,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Text(
                              "Story point",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                          TextField(
                            controller: controllerSP,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Введите кол-во story point'ов",
                              fillColor: Colors.white70,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: ElevatedButton(
                              onPressed: () {
                                addUser(controllerName.text, int.parse(controllerMaster.text), int.parse(controllerSP.text));
                                Navigator.pop(context);
                              },
                              child: Text("Добавить"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.black,
                                  ),
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      });
}