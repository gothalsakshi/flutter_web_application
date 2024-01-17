import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/tabbar/tabbar_bloc/tabbar_bloc.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<TabbarBloc>().tabController =
        TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabbarBloc, TabbarState>(
      builder: (context, state) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
              body: Column(
                children: [
                  TabBar(
                      controller: context.read<TabbarBloc>().tabController,
                      onTap: (index) {
                        BlocProvider.of<TabbarBloc>(context)
                            .add(TabbarChangeEvent(tabBarIndex: index));
                      },
                      tabs: const [
                        Tab(icon: Icon(Icons.abc), text: "screen 1"),
                        Tab(
                            icon: Icon(Icons.access_alarm_rounded),
                            text: "screen 2")
                      ]),
                  Expanded(
                    child: TabBarView(
                        controller: context.read<TabbarBloc>().tabController,
                        children: [screenOne(), screenTwo()]),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget screenOne() {
    return Container(
      height: 300,
      color: Colors.red,
    );
  }

  Widget screenTwo() {
    return Container(
      height: 300,
      color: Colors.blue,
    );
  }
}
