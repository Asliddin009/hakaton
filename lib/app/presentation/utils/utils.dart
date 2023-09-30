import 'package:flutter/material.dart';
import 'package:hakaton/app/data/shared_preferences/shared_preferences_storag.dart';

abstract class Utils{
  static Map<String, String> getHeaders(){
    PreferencesStorage.getAuthToken().then((value) {
      return {"Authorization":value};
    });
    return {"Authorization":"test"};
  }

  static bool checkScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
          ? true
          : false;

}