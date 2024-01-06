import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/view/completed_task_scren.dart';
import 'package:flutter_web_application/presentation/todo/view/task_screen.dart';

import '../blocs/navigation_bar_bloc/navigation_bar_bloc.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
                  onTap: (int tappedIndex) {
                    BlocProvider.of<NavigationBarBloc>(context)
                        .add(ChangedNavigationBarEvent(currentIndex: tappedIndex));
                  },
                  currentIndex: context.read<NavigationBarBloc>().currentIndex,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.padding), label: "Pending Task"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.check_box), label: "Completed Task")
                  ]),
          body: IndexedStack(
            index: context.read<NavigationBarBloc>().currentIndex,
            children: const [TaskScreen(),CompletedTaskScreen()],
          ),
        );
      },
    );
  }
}
