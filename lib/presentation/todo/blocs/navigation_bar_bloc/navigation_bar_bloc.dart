import 'package:bloc/bloc.dart';
import 'package:flutter_web_application/presentation/todo/view/pending_task_scren.dart';
import 'package:flutter_web_application/presentation/todo/view/show_list_screen.dart';
import 'package:meta/meta.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  int currentIndex = 0;
  final pages = [
    const PendingTaskScreen(), const ShowListScreen()
  ];
  NavigationBarBloc() : super(NavigationBarInitial(currentIndex: 0)) {
    on<NavigationBarEvent>((event, emit) {
      if(event is ChangedNavigationBarEvent){
        emit(ChangedNavigationBarState(changedIndex: currentIndex));
      }
    });
  }

  void changeIndexOfBottomAppBar(int tappedIndex){
    currentIndex = tappedIndex;
  }
}
