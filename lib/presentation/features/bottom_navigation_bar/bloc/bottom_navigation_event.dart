part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent {}

class BottomNavigationInitialEvent extends BottomNavigationEvent {

}

class BottomNavigationChangeEvent extends BottomNavigationEvent {
  final int currentIndex;

  BottomNavigationChangeEvent({required this.currentIndex});
}
