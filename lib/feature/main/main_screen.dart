import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hakaton/app/data/shared_preferences/shared_preferences_storag.dart';
import 'package:hakaton/app/domain/app_api.dart';
import 'package:hakaton/app/presentation/components/app_snack_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton/app/presentation/components/app_text_button.dart';
import 'package:hakaton/feature/auth/ui/Chirin.dart';
import 'package:hakaton/feature/main/domain/entity/project_entity.dart';

import '../../app/data/global_const.dart';
import '../../app/presentation/utils/utils.dart';
import '../sprint_table/ToDo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double countSprint = 1;
  bool flagLoading = true;
  List<String> list = [];

  @override
  void initState() {
    getProjects();
    super.initState();
  }

  void getProjects() async {
    final token = await PreferencesStorage.getAuthToken();
    final dio = Dio();
    final response = await dio.get("$APP_URL/api/v1/my_projects/",
        options: Options(headers: {"Authorization": token}));
    if (response.statusCode == 200) {
      for (int i = 0; i < (response.data['projects']).length; i++) {
        list.add(response.data['projects'][i]['title']);
      }
      flagLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (flagLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: const EdgeInsets.all(35),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                //blurRadius: 5,
                //offset: Offset(0, 3), // Вы можете настроить смещение теней по своему усмотрению
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
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
                          )
                        ],
                      )),
                ],
              )),
              Expanded(
                  flex: 9,
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width * 0.9,
                          color: Colors.black,
                        ),

                        /*Align(
                          alignment: const Alignment(0.7,-0.9),
                          child: Container(
                            child: SvgPicture.asset(
                              'assets/vector_create_project.svg',
                              width: MediaQuery.of(context).size.width/8,
                            ),
                          ),
                        ),
*/
                        list == []
                            ? Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/main_back.svg',
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) => Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    splashColor: Colors.red.withAlpha(50),
                                    onTap: () {Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const ToDo()),
                                    );},
                                    child: SizedBox(
                                      width: 300,
                                      height: 100,
                                      child: ListTile(
                                        title: Text(list[index]),
                                        subtitle: Text('Написать бэк'),
                                      ),
                                    ),
                                  ),
                                ),
                                itemCount: list.length),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
