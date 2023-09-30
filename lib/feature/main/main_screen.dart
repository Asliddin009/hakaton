import 'package:flutter/material.dart';
import 'package:hakaton/feature/sprint_generate/ui/split_generate_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double countSprint = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Главная страничка")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        ListView(children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SplitGenerateScreen()));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25))
                ,color: Colors.blue
              ),
              child: Center(child: Text("Генератор спринтов")),

            ),
          )
        ],),
      ),
    );
  }
}
