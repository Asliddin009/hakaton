import 'package:flutter/material.dart';

Future<void> _createTask(BuildContext context) {
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
                      'Создание Задачи',
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
                        "Название задачи",
                        style: TextStyle(fontSize: 22),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Введите название задачи",
                          fillColor: Colors.white70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                        child: Text(
                          "Приоритет задачи",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Введите приоритет задачи",
                          fillColor: Colors.white70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                        child: Text(
                          "Тег",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Введите тег задачи",
                          fillColor: Colors.white70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                        child: Text(
                          "Сложность",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Введите сложность задачи",
                          fillColor: Colors.white70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                        child: Text(
                          "Story points",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Введите story points",
                          fillColor: Colors.white70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Создать"),
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
