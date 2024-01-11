import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/features/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/task_bloc/task_bloc.dart';
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
        BlocProvider<TaskBloc>(create: (ctx) => TaskBloc()),
        BlocProvider<SwitchBloc>(create: (ctx) => SwitchBloc())
        // BlocProvider(create: TaskBloc()..add(AddTaskEvent(task: Task(task: 'Task 1'))))
      ],
      // create: (context) => BottomNavigationBarCubit(),
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            // darkTheme: state.switchValue ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.switchValue ? ThemeData.dark() : ThemeData.light(),
            home: const TaskScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
