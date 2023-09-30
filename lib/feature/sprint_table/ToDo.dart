import 'package:flutter/material.dart';

import 'GetProject.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
var tasks;
int quantity_todo = 0;
int quantity_review = 0;
int quantity_done = 0;
bool flag=false;



  void GetTasks() async{
    tasks = await getHttp();
    for (int i = 0; i < tasks["tasks"].length; i++){
      if (tasks["tasks"][i]["status"] == "ToDo"){
        quantity_todo += 1;
      }
      if (tasks["tasks"][i]["status"] == "Review"){
        quantity_review += 1;
      }
      if (tasks["tasks"][i]["status"] == "Done"){
        quantity_done += 1;
      }
    }
    flag=true;
    setState(() {

    });
  }



  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Название задачи'),
          content: const Text(
            'Написать охуенные бэк',
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Исполнитель: "),
                  SizedBox(height: 10,),
                  Text("Статус: "),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Закрыть'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('следующий этап'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    GetTasks();
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    if(flag==false){
      return Scaffold(body: Center(child: CircularProgressIndicator(),),);
    }else {
      return Scaffold(
      appBar: AppBar(title:Text("Проект")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                      "Backlog",
                    style: TextStyle(
                      fontSize: 24
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                        itemCount: tasks["tasks"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              splashColor: Colors.red.withAlpha(50),
                              onTap: () => _dialogBuilder(context),
                              child: const SizedBox(
                                width: 300,
                                height: 100,
                                child: ListTile(
                                  title: Text('Задача'),
                                  subtitle: Text('Написать бэк'),
                                ),
                                ),
                              ),
                            );
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "ToDo",
                    style: TextStyle(
                        fontSize: 24
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: quantity_todo,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(50),
                                onTap: () => _dialogBuilder(context),
                                child: const SizedBox(
                                  width: 300,
                                  height: 100,
                                  child: ListTile(
                                    title: Text('Задача'),
                                    subtitle: Text('Написть бэк'),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Review",
                    style: TextStyle(
                        fontSize: 24
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: quantity_review,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(50),
                                onTap: () => _dialogBuilder(context),
                                child: const SizedBox(
                                  width: 300,
                                  height: 100,
                                  child: ListTile(
                                    title: Text('Задача'),
                                    subtitle: Text('Написть бэк'),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                children: [
                    const Text(
                      "Done",
                      style: TextStyle(
                          fontSize: 24
                      ),
                    ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: quantity_done,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(50),
                                onTap: () => _dialogBuilder(context),
                                child: const SizedBox(
                                  width: 300,
                                  height: 100,
                                  child: ListTile(
                                    title: Text('Задача'),
                                    subtitle: Text('Написть бэк'),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
    }
  }
}


