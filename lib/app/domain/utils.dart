import 'package:flutter/material.dart';


abstract class Utils{
  static bool checkScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
          ? true
          : false;

}
