import 'package:flutter/material.dart';
import 'package:hakaton/app/presentation/components/local_app_bar_.dart';
import 'GetProject.dart';
import 'domain/entity/task_entity.dart';

class ToDo extends StatefulWidget {
  ToDo({super.key, required this.title,required this.id});

  String title;
  String id;
  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  var tasks;
  int quantity_todo = 0;
  int quantity_review = 0;
  int quantity_done = 0;
  bool flag = false;

  List<TaskEntity> listTaskBackground=[];
  List<TaskEntity> listTaskTodo=[];
  List<TaskEntity> listTaskReview=[];
  List<TaskEntity> listTaskTodoDone=[];

  void GetTasks() async {
    tasks = await getHttp();
    for (int i = 0; i < tasks["tasks"].length; i++) {
      if (tasks["tasks"][i]["status"] == "ToDo") {
        quantity_todo += 1;
        listTaskTodo.add(TaskEntity.fromJson(tasks["tasks"][i]));
      }
      if (tasks["tasks"][i]["status"] == "Review") {
        quantity_review += 1;
        listTaskReview.add(TaskEntity.fromJson(tasks["tasks"][i]));
      }
      if (tasks["tasks"][i]["status"] == "Done") {
        listTaskTodoDone.add(TaskEntity.fromJson(tasks["tasks"][i]));
        quantity_done += 1;
      }
    }
    flag = true;
    setState(() {});
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
                  const Text("Исполнитель: "),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Статус: "),
                  const SizedBox(
                    height: 10,
                  ),
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
    if (flag == false) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const LocalAppBar(),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 2,
                  color: Colors.black,
                  width: double.infinity,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 45, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${widget.title} ${widget.id}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                  height: 2,
                  color: Colors.black,
                  width: double.infinity,
                ),
              ],
            )),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Задачи",
                          style: TextStyle(fontSize: 24),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: listTaskBackground.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.red.withAlpha(50),
                                      onTap: () => _dialogBuilder(context),
                                      child:  SizedBox(
                                        width: 300,
                                        height: 100,
                                        child: ListTile(
                                          title: Text(listTaskBackground[index].title),
                                          subtitle: Text(listTaskBackground[index].tag),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Container(
                          height: 2,
                          width: double.infinity * 0.8,
                          color: Colors.black,
                        ),
                        Expanded(
                            child: Container(
                          color: Colors.white70,
                          height: 10,
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Text(
                              "Добавить задачу",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {showDialogForCreateTask(context);},
                            label: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.add,
                                size: 55,
                                color: Colors.blue,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black,
                              ),
                            ),
                          ),
                        )),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 2,
                          width: double.infinity * 0.8,
                          color: Colors.black,
                        ),
                        Expanded(
                            child: ElevatedButton.icon(
                          icon: const Text(
                            "Агрегировать задачи на спринт",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                          label:
                            Icon(
                              Icons.arrow_right_alt,
                              size: 55,
                              color: Colors.blue,
                            ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.black,
                            ),
                          ),
                        )),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 2,
                          width: double.infinity * 0.8,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 2,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "К работе",
                          style: TextStyle(fontSize: 24),
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
                                      child:  SizedBox(
                                        width: 300,
                                        height: 100,
                                        child: ListTile(
                                          title: Text(listTaskTodo[index].title),
                                          subtitle: Text(listTaskTodo[index].tag),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 2,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "В работе",
                          style: TextStyle(fontSize: 24),
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
                                      child:  SizedBox(
                                        width: 300,
                                        height: 100,
                                        child: ListTile(
                                          title: Text(listTaskReview[index].title),
                                          subtitle: Text(listTaskReview[index].tag),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 2,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Готово",
                          style: TextStyle(fontSize: 24),
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
                                      child:  SizedBox(
                                        width: 300,
                                        height: 100,
                                        child: ListTile(
                                          title: Text(listTaskTodoDone[index].title),
                                          subtitle: Text(listTaskTodoDone[index].tag),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
    }
  }
  Future<void> showDialogForCreateTask(BuildContext context) {
    final controllerTitle = TextEditingController();
    final controllerPriority = TextEditingController();
    final controllerTag = TextEditingController();
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
                            controller: controllerTitle,
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
    controller: controllerPriority,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                filled: true,

    hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Введите приоритет задачи",
                                fillColor: Colors.white70,
                              ),
    keyboardType: TextInputType.number,

    ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                              child: Text(
                                "Тег",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            TextField(
                              controller: controllerTag,
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
                              controller: controllerMaster,
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
                              controller: controllerSP,
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
                                onPressed: () {
                                  listTaskBackground.add(TaskEntity(title: controllerTitle.text, priority: int.tryParse(controllerPriority.text)??1, tag: controllerTag.text, story_point:int.tryParse(controllerSP.text)??1 ));
                                  setState(() {

                                  });
                                  Navigator.pop(context);
                                },
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

}
