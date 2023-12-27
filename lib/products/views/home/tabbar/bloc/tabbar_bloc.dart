import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(const TabbarInitial(tabIndex: 0)){
    on<TabbarEvent>((event, emit) {
      if(event is TabChange){
        emit(TabbarInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
