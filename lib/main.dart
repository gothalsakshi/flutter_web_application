import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/features/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_web_application/presentation/form_validation/form_validation_bloc/form_validation_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/task_bloc/task_bloc.dart';
import 'package:flutter_web_application/presentation/todo/view/routes.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'presentation/features/bottom_navigation_bar/cubit/bottom_navigation_bar_cubit.dart';
import 'presentation/form_validation/view/login_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:  await getTemporaryDirectory());
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
        BlocProvider<SwitchBloc>(create: (ctx) => SwitchBloc()),
        BlocProvider<FormValidationBloc>(create: (ctx) => FormValidationBloc())
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
            home: const LoginScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
