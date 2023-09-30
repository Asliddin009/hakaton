import 'package:flutter/material.dart';
class SplitGenerateScreen extends StatefulWidget {
  const SplitGenerateScreen({super.key});

  @override
  State<SplitGenerateScreen> createState() => _SplitGenerateScreenState();
}

class _SplitGenerateScreenState extends State<SplitGenerateScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double countSprint=1;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Генерация спринтов"),),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Задача"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Text("Количество Спринтов: ${countSprint.toString()} "),
                Slider(
                  label: countSprint.toString(),
                  min: 1,
                  max: 10,
                  divisions: 10,
                  value: countSprint,
                  onChanged: (double value) {
                    setState(() {
                      countSprint = value.round().toDouble();
                    });
                  },
                )
              ],
            ),

            ElevatedButton(
                onPressed: () {}, child: const Text("Сгенерировать спринты")),
          ],
        ),
      ),
    );
  }
}
