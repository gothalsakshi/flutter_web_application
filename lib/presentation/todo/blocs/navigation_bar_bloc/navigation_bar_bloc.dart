import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  int currentIndex = 0;
  NavigationBarBloc() : super(NavigationBarInitial(currentIndex: 0)) {
    on<NavigationBarEvent>((event, emit) {
       if(event is ChangedNavigationBarEvent){
        currentIndex = event.currentIndex;
        emit(ChangedNavigationBarState(changedIndex: currentIndex));
        debugPrint("on change event --->${event.currentIndex}---$currentIndex");
        
      }
    });
  }
}
