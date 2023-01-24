import 'package:flutter/material.dart';
import 'package:todo_flutter/models/enums/language.dart';
import 'package:todo_flutter/other/lang.dart';

class LangProvider with ChangeNotifier{
  Language configuredLang;
  LangProvider({required this.configuredLang});

  String get(String key){
    if(configuredLang == Language.es){
      return Lang.spanish[key] != null ? Lang.spanish[key]! : "";
    }
    else{
      return Lang.english[key] != null ? Lang.english[key]! : "";
    }
  }


  
}