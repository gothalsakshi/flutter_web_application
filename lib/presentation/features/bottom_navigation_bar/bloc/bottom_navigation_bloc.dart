import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;
  BottomNavigationBloc() : super(BottomNavigationInitial(initialIndex: 0)) {
    on<BottomNavigationEvent>((event, emit) {
       if(event is BottomNavigationChangeEvent){
        currentIndex = event.currentIndex;
        emit(BottomNavigationChangeState(changedIndex: currentIndex));
        debugPrint("on change event --->${event.currentIndex}---$currentIndex");
        
      }
    });
  }
}
