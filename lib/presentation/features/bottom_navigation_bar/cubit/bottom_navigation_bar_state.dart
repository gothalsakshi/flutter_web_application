part of 'bottom_navigation_bar_cubit.dart';


abstract class BottomNavigationBarState {}

class BottomNavigationBarInitial extends BottomNavigationBarState {
  final int currentIndex;

  BottomNavigationBarInitial({required this.currentIndex});
}

class BottomNavigationChangeState extends BottomNavigationBarState {
  final int currentIndex;

  BottomNavigationChangeState({required this.currentIndex});
}
