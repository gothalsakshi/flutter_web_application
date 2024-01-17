part of 'tabbar_bloc.dart';

sealed class TabbarEvent extends Equatable {
  const TabbarEvent();

  @override
  List<Object> get props => [];
}

class TabbarChangeEvent extends TabbarEvent{
  final int tabBarIndex;

  const TabbarChangeEvent({required this.tabBarIndex});
}