part of 'navigation_bar_bloc.dart';

@immutable
sealed class NavigationBarState {}

final class NavigationBarInitial extends NavigationBarState {
  final int currentIndex;

  NavigationBarInitial({required this.currentIndex});
}

final class ChangedNavigationBarState extends NavigationBarState{
  final int changedIndex;

  ChangedNavigationBarState({required this.changedIndex});
}
