part of 'navigation_bar_bloc.dart';

@immutable
sealed class NavigationBarEvent {}

final class ChangedNavigationBarEvent extends NavigationBarEvent{}
