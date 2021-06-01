import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:null_rest_api/services/album_service.dart';
import 'package:null_rest_api/services/food_service.dart';
import 'package:null_rest_api/services/notes_service.dart';
import 'package:null_rest_api/views/album_list.dart';
import 'package:null_rest_api/views/food_list.dart';
import 'package:null_rest_api/views/note_list.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => FoodService()); //TODO change
}

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodList(), //TODO change
    );
  }
}
