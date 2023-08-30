// ignore_for_file: prefer_const_constructors, avoid_print
// import 'bloc_basics/bloc/box_bloc.dart';
// import 'package:bloc_demo/bloc_basics/views/home_view.dart';
import 'package:bloc_demo/todo_app/bloc/todo_bloc.dart';
import 'package:bloc_demo/todo_app/views/todo_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

//! bloc_basics
// void main() => runApp(MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => BoxBloc()..add(LoadBoxCounter()),
//         ),
//       ],
//       child: MyApp(),
//     ));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      home: BlocProvider<TodoBloc>(
        create: (context) => TodoBloc()..add(TodoStart()),
        child: ToDoHomeView(),
      ),
      // home: BasicHomeView(),
    );
  }
}
