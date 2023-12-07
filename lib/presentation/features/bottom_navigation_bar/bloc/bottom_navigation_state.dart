part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState {}
 
class BottomNavigationInitial extends BottomNavigationState {
  final int initialIndex;

  BottomNavigationInitial({required this.initialIndex});
}

class BottomNavigationChangeState extends BottomNavigationState {
  final int changedIndex;

  BottomNavigationChangeState({required this.changedIndex});
}
