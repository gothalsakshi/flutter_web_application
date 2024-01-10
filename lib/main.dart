import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/features/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/task/task_bloc.dart';
import 'package:flutter_web_application/presentation/todo/view/routes.dart';
import 'package:flutter_web_application/presentation/todo/view/task_screen.dart';
import 'presentation/features/bottom_navigation_bar/cubit/bottom_navigation_bar_cubit.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
            create: (ctx) => BottomNavigationBloc()),
        BlocProvider<BottomNavigationBarCubit>(
            create: (ctx) => BottomNavigationBarCubit()),
        BlocProvider<NavigationBarBloc>(create: (ctx) => NavigationBarBloc()),
        BlocProvider<TaskBloc>(create: (ctx) => TaskBloc())
        // BlocProvider(create: TaskBloc()..add(AddTaskEvent(task: Task(task: 'Task 1'))))
      ],
      // create: (context) => BottomNavigationBarCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TaskScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
