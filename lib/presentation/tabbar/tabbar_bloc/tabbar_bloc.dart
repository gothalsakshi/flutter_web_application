import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabController? tabController;
  int initialIndex = 0;
  TabbarBloc() : super(TabbarInitial()) {
    on<TabbarChangeEvent>((event, emit) {
      emit(TabbarChangeState(tabBarIndex: event.tabBarIndex));
    });
  }
}
