import 'package:bloc/bloc.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial(currentIndex: 0));
  int index = 0;


  void changeIndex(int currentIndex){
    index = currentIndex;
    emit(BottomNavigationChangeState(currentIndex: currentIndex));
  }
}
