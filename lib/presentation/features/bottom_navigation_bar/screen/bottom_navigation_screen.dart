import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/features/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';

import 'package:flutter_web_application/presentation/features/cart/screen/cart_screen.dart';
import 'package:flutter_web_application/presentation/features/events/screen/event_screen.dart';
import 'package:flutter_web_application/presentation/features/home/screen/home_screen.dart';
import 'package:flutter_web_application/presentation/features/profile/screen/profile_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              // onTap: (i){
              //   context.read<BottomNavigationBarCubit>().changeIndex(i);
              //   debugPrint("current index--->$i");
              //   debugPrint("index--->${context.read<BottomNavigationBarCubit>().index}");
              // },
              onTap: (i){
                // context.read<BottomNavigationBloc>().currentIndex = i;
                BottomNavigationBloc().add(BottomNavigationChangeEvent(currentIndex: i));
                debugPrint("current index--->$i");
                debugPrint("index--->${BlocProvider.of<BottomNavigationBloc>(context).currentIndex}");
                debugPrint("new index ---->${context.read<BottomNavigationBloc>().currentIndex}");
              },
              fixedColor: const Color.fromRGBO(255, 193, 7, 1),
              // currentIndex: context.read<BottomNavigationBloc>().currentIndex,
              currentIndex: context.read<BottomNavigationBloc>().currentIndex,
              // currentIndex: context.read<BottomNavigationBarCubit>().index,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                    backgroundColor: Colors.red),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wifi_sharp),
                    label: "Cart",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.event),
                    label: "Event",
                    backgroundColor: Colors.deepOrange),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contacts),
                    label: "Profile",
                    backgroundColor: Colors.green)
              ]),
          body: IndexedStack(
            // index: context.read<BottomNavigationBarCubit>().index,
            index: context.read<BottomNavigationBloc>().currentIndex,
            children: const [
              HomeScreen(),
              CartScreen(),
              EventScreen(),
              ProfileScreen(),
            ],
          ),
        );
      },
    );
  }
}
