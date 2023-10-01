import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton/feature/auth/ui/login_screen.dart';
import 'package:hakaton/feature/auth/ui/register_screen.dart';

class Chirin extends StatefulWidget {
  const Chirin({super.key});

  @override
  State<Chirin> createState() => _ChirinState();
}

class _ChirinState extends State<Chirin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/logo.svg',
                        semanticsLabel: 'My SVG Image',
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          "Вход",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));},
                        child: Text("Регистрация"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.black,
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffffffff),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/main.svg',
                  semanticsLabel: 'My SVG Image',
                  height: 500,
                  width: 500,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Система \nуправления",
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Проектами и задачами",
                      style: TextStyle(fontSize: 40),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 500,
                        child: Text(
                          "Удобная в использовании система управления задачами и проектами, основанная на канбан-методологии, которая поможет автоматизировать  и существенно увеличить продуктивность работы вашей команды.",
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton.icon(
                          icon: Text(
                            "Начать",
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.black,
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                          ),
                          onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));},
                          label: Icon(
                            Icons.arrow_forward,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
