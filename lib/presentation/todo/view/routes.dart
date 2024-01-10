import 'package:flutter/material.dart';
import 'package:flutter_web_application/presentation/todo/view/recycle_bin_screen.dart';
import 'package:flutter_web_application/presentation/todo/view/task_screen.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case RecycleBinScreen.id:
        return MaterialPageRoute(builder: (_)=> const RecycleBinScreen());
      case TaskScreen.id:
        return MaterialPageRoute(builder: (_)=> const TaskScreen());
      default:
        null;
    }
    return null;
  }
}