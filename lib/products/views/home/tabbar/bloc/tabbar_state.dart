part of 'tabbar_bloc.dart';

sealed class TabbarState extends Equatable {
  const TabbarState({required this.tabIndex});
  final int tabIndex;
  @override
  List<Object> get props => [tabIndex];
}

final class TabbarInitial extends TabbarState {
  const TabbarInitial({required super.tabIndex});

}
