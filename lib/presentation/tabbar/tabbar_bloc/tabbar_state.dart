part of 'tabbar_bloc.dart';

sealed class TabbarState extends Equatable {
  const TabbarState();
  
  @override
  List<Object> get props => [];
}

final class TabbarInitial extends TabbarState {}

final class TabbarChangeState extends TabbarState {
  final int tabBarIndex;

  const TabbarChangeState({required this.tabBarIndex});
}